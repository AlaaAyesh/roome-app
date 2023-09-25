import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/widgets/forgot_password_text_button.dart';

import '../../../../../core/helpers/helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/my_circular_progress_indicator.dart';
import '../../../../../core/widgets/reusable_pass_text_form_field.dart';
import '../../../../../core/widgets/reusable_text_form_field.dart';
import '../cubit/sign_up_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key, required this.cubit, required this.state});

  final SignUpCubit cubit;
  final SignUpState state;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    disposeFocusNodes();
    disposeControllers();
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
              Helper.validatingEmailField(
                context: context,
                value: value,
              );
              return null;
            },
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(nameFocusNode);
            },
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.04),
          ReusableTextFormField(
            hint: 'Username',
            controller: nameController,
            thisFocusNode: nameFocusNode,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.text,
            prefixIcon: Icons.person,
            validating: (String? value) {
              Helper.validatingNameField(
                context: context,
                value: value,
              );
              return null;
            },
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(passwordFocusNode);
            },
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.04),
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
            onSubmit: (String value) => signUp(context),
            visibilityButtonOnPressed: () =>
                widget.cubit.switchPassVisibility(),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.01),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: ForgotPasswordTextButton(
              onTap: () {},
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: ConditionalBuilder(
              condition: widget.state is! SignUpLoadingState,
              builder: (context) => MyCustomButton(
                height: 47.h,
                width: 305.w,
                onPressed: () => signUp(context),
                hasPrefix: false,
                backgroundColor: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                child: Center(
                  child: Text(
                    'Sign up',
                    style: AppTextStyle.textStyle15.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              fallback: (context) => const MyCircularProgressIndicator(),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.03),
        ],
      ),
    );
  }

  void signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      CustomHelper.keyboardUnfocus(context);

      widget.cubit.userSignUp(
        email: emailController.text.trim(),
        username: nameController.text.trim(),
        password: passwordController.text,
      );
    }
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void disposeFocusNodes() {
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }
}
