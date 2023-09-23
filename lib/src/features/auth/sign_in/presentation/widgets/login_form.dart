import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

import 'package:roome/src/core/widgets/reusable_pass_text_form_field.dart';

import 'package:roome/src/core/widgets/reusable_text_form_field.dart';

import 'remember_me_checkbox.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
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
            hint: 'Email',
            controller: emailController,
            thisFocusNode: emailFocusNode,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.email,
            validating: (String? value) {
              return null;
            },
            onEditingComplete: () {},
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.056),
          ReusablePassTextField(
            controller: passwordController,
            thisFocusNode: passwordFocusNode,
            hint: 'Password',
            prefixIcon: Icons.lock,
            visibilityIcon: Icons.visibility,
            obscure: true,
            validating: (String? value) {
              return null;
            },
            onSubmit: (String value) {},
            visibilityButtonOnPressed: () {},
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.03),
          Row(
            children: <Widget>[
              const RememberMeCheckBox(),
              SizedBox(width: SizeConfig.screenHeight! * 0.008),
              Text(
                'Remember Me',
                style: AppTextStyle.textStyle14Medium,
              ),
              const Spacer(),
              CustomTextButton(
                onTap: () {
                  // TODO:
                },
                child: Text(
                  'Forgot Password?',
                  style: AppTextStyle.textStyle14Medium,
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.04),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: MyCustomButton(
              height: 47.h,
              width: 305.w,
              onPressed: () {},
              hasPrefix: false,
              backgroundColor: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              child: Center(
                child: Text(
                  'Log in',
                  style: AppTextStyle.textStyle15.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.04),
        ],
      ),
    );
  }

  void disposeFocusNodes() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }
}
