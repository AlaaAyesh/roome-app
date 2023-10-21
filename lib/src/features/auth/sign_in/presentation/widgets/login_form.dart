import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../../core/helpers/helper.dart';
import '../../../../../core/widgets/forgot_password_text_button.dart';
import '/src/core/utils/app_colors.dart';
import '/src/core/utils/app_text_styles.dart';
import '/src/core/widgets/reusable_pass_text_form_field.dart';
import '/src/core/widgets/reusable_text_form_field.dart';
import '/src/features/auth/sign_in/presentation/cubit/login_cubit.dart';
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

  final TextEditingController _nameOrEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _nameOrEmailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _disposeControllers();

    _disposeFocusNodes();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          ReusableTextFormField(
            hint: 'Username or Email',
            controller: _nameOrEmailController,
            thisFocusNode: _nameOrEmailFocusNode,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.person,
            validating: (String? value) {
              Helper.validatingNameField(
                textName: 'Username or Email',
                context: context,
                value: value,
              );
              return null;
            },
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.056),
          ReusablePassTextField(
            controller: _passwordController,
            thisFocusNode: _passwordFocusNode,
            hint: 'Password',
            prefixIcon: Icons.lock,
            visibilityIcon: widget.cubit.loginPassVisibility
                ? Icons.visibility_rounded
                : Icons.visibility_off_rounded,
            visibilityButtonOnPressed: () =>
                widget.cubit.switchPassVisibility(),
            obscure: widget.cubit.loginPassVisibility,
            validating: (String? value) {
              Helper.validatingPasswordField(
                context: context,
                value: value,
              );
              return null;
            },
            onSubmit: (String value) => login(context),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.03),
          Row(
            children: <Widget>[
              RememberMeCheckBox(cubit: widget.cubit),
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
            child: MyCustomButton(
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
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.04),
        ],
      ),
    );
  }

  void login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      CustomHelper.keyboardUnfocus(context);
      widget.cubit.userSignIn(
        usernameOrEmail: _nameOrEmailController.text.trim(),
        password: _passwordController.text,
      );
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
}
