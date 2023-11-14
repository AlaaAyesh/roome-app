import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/forgot_password_text_button.dart';
import 'package:roome/src/core/widgets/reusable_pass_text_form_field.dart';
import 'package:roome/src/core/widgets/reusable_text_form_field.dart';
import 'package:roome/src/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:roome/src/features/auth/sign_up/presentation/widgets/name_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key, required this.cubit, required this.state});

  final SignUpCubit cubit;
  final SignUpState state;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

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
  void dispose() {
    super.dispose();

    _disposeFocusNodes();
    _disposeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
              SizedBox(width: SizeConfig.screenWidth! * 0.05),
              NameTextField(
                controller: _lastNameController,
                thisFocusNode: _lastNameFocusNode,
                toFocusNode: _usernameFocusNode,
                hint: 'Last name',
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.02),
          ReusableTextFormField(
            controller: _usernameController,
            hint: 'Username',
            thisFocusNode: _usernameFocusNode,
            prefixIcon: Icons.person,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.none,
            validating: (String? value) {
              Helper.validatingNameField(
                textName: 'Username',
                context: context,
                value: value,
              );
              return null;
            },
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(_emailFocusNode);
            },
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.02),
          ReusableTextFormField(
            hint: 'Email',
            controller: _emailController,
            thisFocusNode: _emailFocusNode,
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
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.02),
          ReusablePassTextField(
            controller: _passwordController,
            thisFocusNode: _passwordFocusNode,
            hint: 'Password',
            prefixIcon: Icons.lock,
            visibilityIcon: widget.cubit.signUpPassVisibility
                ? Icons.visibility_rounded
                : Icons.visibility_off_rounded,
            obscure: widget.cubit.signUpPassVisibility,
            validating: (String? value) {
              Helper.validatingPasswordField(
                context: context,
                value: value,
              );
              return null;
            },
            onSubmit: (String value) => _signUp(context),
            visibilityButtonOnPressed: () {
              widget.cubit.switchPassVisibility();
            },
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
            child: MyCustomButton(
              height: 47.h,
              width: 305.w,
              onPressed: () => _signUp(context),
              hasPrefix: false,
              backgroundColor: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              child: Center(
                child: Text(
                  'Sign up',
                  style: AppTextStyles.textStyle15.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.03),
        ],
      ),
    );
  }

  void _signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      CustomHelper.keyboardUnfocus(context);

      widget.cubit.userSignUp(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        username: _usernameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }
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
}
