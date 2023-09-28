import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

import 'package:roome/src/core/widgets/reusable_pass_text_form_field.dart';

import 'package:roome/src/core/widgets/reusable_text_form_field.dart';
import 'package:roome/src/features/auth/sign_in/presentation/cubit/login_cubit.dart';

import '../../../../../core/helpers/helper.dart';
import '../../../../../core/widgets/forgot_password_text_button.dart';
import '../../../../../core/widgets/my_circular_progress_indicator.dart';
import 'remember_me_checkbox.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.cubit, required this.state});

  final LoginCubit cubit;
  final LoginState state;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    disposeControllers();

    disposeFocusNodes();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          ReusableTextFormField(
            hint: 'Username',
            controller: nameController,
            thisFocusNode: nameFocusNode,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.text,
            prefixIcon: Icons.person,
            validating: (String? value) {
              Helper.validatingNameField(
                textName: 'Username',
                context: context,
                value: value,
              );
              return null;
            },
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(passwordFocusNode);
            },
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.056),
          ReusablePassTextField(
            controller: passwordController,
            thisFocusNode: passwordFocusNode,
            hint: 'Password',
            prefixIcon: Icons.lock,
            visibilityIcon: widget.cubit.passVisibility
                ? Icons.visibility_rounded
                : Icons.visibility_off_rounded,
            obscure: widget.cubit.passVisibility,
            validating: (String? value) {
              Helper.validatingPasswordField(
                context: context,
                value: value,
              );
              return null;
            },
            onSubmit: (String value) => login(context),
            visibilityButtonOnPressed: () =>
                widget.cubit.switchPassVisibility(),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.03),
          Row(
            children: <Widget>[
              const RememberMeCheckBox(),
              SizedBox(width: SizeConfig.screenHeight! * 0.008),
              Text(
                'Remember Me',
                style: AppTextStyles.textStyle14Medium,
              ),
              const Spacer(),
              ForgotPasswordTextButton(
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.04),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: ConditionalBuilder(
              condition: widget.state is! SignInLoadingState,
              builder: (context) => MyCustomButton(
                height: 47.h,
                width: 305.w,
                onPressed: () => login(context),
                hasPrefix: false,
                backgroundColor: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                child: Center(
                  child: Text(
                    'Log in',
                    style: AppTextStyles.textStyle15.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              fallback: (context) => const MyCircularProgressIndicator(),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.04),
        ],
      ),
    );
  }

  void login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      debugPrint('VALIDATED');
      CustomHelper.keyboardUnfocus(context);
      widget.cubit.userSignIn(
        username: nameController.text.trim(),
        password: passwordController.text,
      );
    }
  }

  void disposeFocusNodes() {
    nameFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  void disposeControllers() {
    nameController.dispose();
    passwordController.dispose();
  }
}
