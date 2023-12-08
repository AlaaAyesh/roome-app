import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:roome/service_locator.dart';
import 'package:roome/src/config/router/routes.dart';
import 'package:roome/src/config/services/notification_service.dart';
import 'package:roome/src/core/helpers/auth_helper.dart';
import 'package:roome/src/core/helpers/cache_helper.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/custom_loading_dialog.dart';
import 'package:roome/src/core/widgets/custom_snack_bar.dart';
import 'package:roome/src/core/widgets/custom_text_form_field.dart';
import 'package:roome/src/core/widgets/main_button.dart';
import 'package:roome/src/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:roome/src/features/auth/presentation/widgets/forgot_password_text_button.dart';
import 'package:roome/src/features/auth/presentation/widgets/login/remember_me_checkbox.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final GlobalKey<FormState> _formKey;
  late AutovalidateMode autoValidateMode;

  final TextEditingController _nameOrEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _nameOrEmailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    _initFormAttributes();
    super.initState();
  }

  void _initFormAttributes() {
    _formKey = GlobalKey<FormState>();
    autoValidateMode = AutovalidateMode.disabled;
  }

  @override
  void dispose() {
    super.dispose();

    _disposeControllers();

    _disposeFocusNodes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) => _handleLoginStates(state),
      builder: (context, state) {
        LoginCubit cubit = BlocProvider.of<LoginCubit>(context);

        return Form(
          key: _formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: <Widget>[
              CustomTextFormField(
                hintText: 'Username or Email',
                controller: _nameOrEmailController,
                focusNode: _nameOrEmailFocusNode,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.person,
                validating: (String? value) {
                  return AuthHelper.validatingNameField(
                    textName: 'Name or Email',
                    value: value,
                  );
                },
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                autofillHints: const <String>[
                  AutofillHints.email,
                  AutofillHints.name,
                ],
              ),
              SizedBox(height: 56.h),
              CustomTextFormField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                hintText: 'Password',
                prefixIcon: Icons.lock,
                suffix: IconButton(
                  onPressed: () => cubit.switchPassVisibility(),
                  icon: Icon(
                    cubit.loginPassVisibility
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    size: 24.h,
                    color: Colors.grey,
                  ),
                ),
                obscureText: cubit.loginPassVisibility,
                autofillHints: const <String>[AutofillHints.password],
                validating: (String? value) {
                  return AuthHelper.validatingPasswordField(value: value);
                },
                onSubmit: (String value) => _login(context),
              ),
              SizedBox(height: 34.h),
              Row(
                children: <Widget>[
                  RememberMeCheckBox(cubit: cubit),
                  SizedBox(width: 8.w),
                  Text(
                    'Remember Me',
                    style: AppTextStyles.textStyle14Medium,
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: ForgotPasswordTextButton(
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34.h),
              MainButton(
                text: 'Log In',
                onPressed: () => _login(context),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        );
      },
    );
  }

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      AuthHelper.keyboardUnfocus(context);
      BlocProvider.of<LoginCubit>(context).userSignIn(
        usernameOrEmail: _nameOrEmailController.text.trim(),
        password: _passwordController.text,
      );
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  void _disposeFocusNodes() {
    _nameOrEmailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  void _disposeControllers() {
    _nameOrEmailController.dispose();
    _passwordController.dispose();
  }

  void _handleLoginStates(LoginState state) {
    if (state is SignInLoadingState) {
      CustomLoadingDialog.show(context);
    }

    if (state is SignInSuccessState) {
      _handleSignInSuccessState(context, state);
    }

    if (state is SignInErrorState) {
      _handleSignInErrorState(context, state);
    }
  }

  void _handleSignInSuccessState(
    BuildContext context,
    SignInSuccessState state,
  ) {
    context.getBack();
    serviceLocator
        .get<CacheHelper>()
        .saveData(key: 'uId', value: state.uId)
        .then((value) {
      if (value) {
        Helper.uId = state.uId;
        Helper.getUserAndFavorites(context);
        context.navigateAndReplacement(newRoute: Routes.roomViewRoute);
        _weMissedYouNotification(state);
      }
    });
  }

  void _weMissedYouNotification(SignInSuccessState state) {
    NotificationService.triggerNotification(
      title: AppStrings.welcomeBack,
      body:
          'We missed you, ${state.userModel.firstName} ${AppStrings.smilingFaceEmoji}',
    );
  }

  void _handleSignInErrorState(BuildContext context, SignInErrorState state) {
    context.getBack();
    CustomSnackBar.show(
      context: context,
      message: state.error,
      state: CustomSnackBarState.error,
    );
  }
}
