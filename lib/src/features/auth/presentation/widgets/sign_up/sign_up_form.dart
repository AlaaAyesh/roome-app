import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/service_locator.dart';
import 'package:roome/src/config/router/routes.dart';
import 'package:roome/src/config/services/notification_service.dart';
import 'package:roome/src/core/helpers/auth_helper.dart';
import 'package:roome/src/core/helpers/cache_helper.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/core/widgets/custom_loading_dialog.dart';
import 'package:roome/src/core/widgets/custom_snack_bar.dart';
import 'package:roome/src/core/widgets/custom_text_form_field.dart';
import 'package:roome/src/core/widgets/main_button.dart';
import 'package:roome/src/features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:roome/src/features/auth/presentation/widgets/forgot_password_text_button.dart';
import 'package:roome/src/features/auth/presentation/widgets/sign_up/name_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final GlobalKey<FormState> _formKey;
  late AutovalidateMode autoValidateMode;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
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

  void _disposeControllers() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _disposeFocusNodes() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _usernameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  void dispose() {
    super.dispose();

    _disposeFocusNodes();
    _disposeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) => _controlSignUpViewStates(state, context),
      builder: (context, state) {
        SignUpCubit cubit = BlocProvider.of<SignUpCubit>(context);

        return Form(
          key: _formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  NameTextField(
                    controller: _firstNameController,
                    thisFocusNode: _firstNameFocusNode,
                    toFocusNode: _lastNameFocusNode,
                    hint: 'First name',
                  ),
                  SizedBox(width: 40.w),
                  NameTextField(
                    controller: _lastNameController,
                    thisFocusNode: _lastNameFocusNode,
                    toFocusNode: _usernameFocusNode,
                    hint: 'Last name',
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                controller: _usernameController,
                hintText: 'Username',
                focusNode: _usernameFocusNode,
                prefix: Icon(
                  Icons.person,
                  size: AppConstants.authPrefixIconSize,
                  color: AppConstants.authPrefixIconColor,
                ),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.none,
                autofillHints: const <String>[AutofillHints.username],
                validating: (String? value) {
                  return AuthHelper.validatingNameField(
                    textName: 'Username',
                    value: value,
                  );
                },
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                hintText: 'Email',
                controller: _emailController,
                focusNode: _emailFocusNode,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.emailAddress,
                prefix: Icon(
                  Icons.email,
                  size: AppConstants.authPrefixIconSize,
                  color: AppConstants.authPrefixIconColor,
                ),
                autofillHints: const <String>[AutofillHints.email],
                validating: (String? value) {
                  return AuthHelper.validatingEmailField(
                    value: value,
                  );
                },
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                hintText: 'Password',
                prefix: Icon(
                  Icons.lock,
                  size: AppConstants.authPrefixIconSize,
                  color: AppConstants.authPrefixIconColor,
                ),
                autofillHints: const <String>[AutofillHints.password],
                suffix: IconButton(
                  onPressed: () => cubit.switchPassVisibility(),
                  icon: Icon(
                    cubit.signUpPassVisibility
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                  ),
                ),
                obscureText: cubit.signUpPassVisibility,
                validating: (String? value) {
                  return AuthHelper.validatingPasswordField(
                    value: value,
                  );
                },
                onSubmit: (String value) => _signUp(context),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: ForgotPasswordTextButton(
                  onTap: () {},
                ),
              ),
              SizedBox(height: 30.h),
              MainButton(
                text: 'Sign up',
                onPressed: () => _signUp(context),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        );
      },
    );
  }

  void _signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      AuthHelper.keyboardUnfocus(context);

      BlocProvider.of<SignUpCubit>(context).userSignUp(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        username: _usernameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  void _controlSignUpViewStates(SignUpState state, BuildContext context) {
    if (state is SignUpLoadingState) {
      CustomLoadingDialog.show(context);
    }

    if (state is SignUpErrorState) {
      _handleSignUpErrorState(context, state);
    }

    if (state is SignUpSuccessState) {
      _handleSignUpSuccessState(context, state);
    }
  }

  void _handleSignUpSuccessState(
    BuildContext context,
    SignUpSuccessState state,
  ) {
    context.getBack();
    getIt
        .get<CacheHelper>()
        .saveData(key: 'uId', value: state.uId)
        .then((value) {
      if (value) {
        Helper.uId = state.uId;
        Helper.getUserAndFavorites(context);
        AuthHelper.accountCreatedSnackBar(context);
        context.navigateAndReplacement(newRoute: Routes.roomViewRoute);
        _sayHelloNotification(state);
      }
    });
  }

  void _handleSignUpErrorState(BuildContext context, SignUpErrorState state) {
    context.getBack();
    CustomSnackBar.show(
      context: context,
      message: state.error,
      state: CustomSnackBarState.error,
    );
  }

  void _sayHelloNotification(SignUpSuccessState state) {
    NotificationService.triggerNotification(
      title: AppStrings.helloFromRoome,
      body:
          'Hello from Roome, ${state.userModel.firstName} ${AppStrings.waveEmoji}',
    );
  }
}
