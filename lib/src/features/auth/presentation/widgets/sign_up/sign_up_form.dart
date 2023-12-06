import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/helpers/auth_helper.dart';
import 'package:roome/src/core/widgets/custom_text_form_field.dart';
import 'package:roome/src/core/widgets/main_button.dart';
import 'package:roome/src/features/auth/presentation/widgets/forgot_password_text_button.dart';
import 'package:roome/src/features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:roome/src/features/auth/presentation/widgets/sign_up/name_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key, required this.cubit, required this.state});

  final SignUpCubit cubit;
  final SignUpState state;

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
              SizedBox(width: 50.h),
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
            prefixIcon: Icons.person,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.none,
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
            prefixIcon: Icons.email,
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
            prefixIcon: Icons.lock,
            suffix: IconButton(
              onPressed: () => widget.cubit.switchPassVisibility(),
              icon: Icon(
                widget.cubit.signUpPassVisibility
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
              ),
            ),
            obscureText: widget.cubit.signUpPassVisibility,
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
  }

  void _signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      AuthHelper.keyboardUnfocus(context);

      widget.cubit.userSignUp(
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
