import 'package:flutter/material.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/features/auth/presentation/widgets/auth_button.dart';
import 'package:roome/src/features/auth/presentation/widgets/forgot_password_text_button.dart';
import 'package:roome/src/features/auth/presentation/widgets/reusable_pass_text_form_field.dart';
import 'package:roome/src/features/auth/presentation/widgets/reusable_text_form_field.dart';
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
              const SizedBox(width: 50),
              NameTextField(
                controller: _lastNameController,
                thisFocusNode: _lastNameFocusNode,
                toFocusNode: _usernameFocusNode,
                hint: 'Last name',
              ),
            ],
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
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
          const SizedBox(height: 10),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: ForgotPasswordTextButton(
              onTap: () {},
            ),
          ),
          const SizedBox(height: 30),
          AuthButton(
            buttonTitle: 'Sign up',
            onPressed: () => _signUp(context),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  void _signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Helper.keyboardUnfocus(context);

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
