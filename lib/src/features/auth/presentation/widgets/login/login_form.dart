import 'package:flutter/material.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/auth/presentation/widgets/auth_button.dart';
import 'package:roome/src/features/auth/presentation/widgets/forgot_password_text_button.dart';
import 'package:roome/src/features/auth/presentation/widgets/reusable_pass_text_form_field.dart';
import 'package:roome/src/features/auth/presentation/widgets/reusable_text_form_field.dart';
import 'package:roome/src/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:roome/src/features/auth/presentation/widgets/login/remember_me_checkbox.dart';

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
            autoFillHints: const <String>[AutofillHints.email],
          ),
          const SizedBox(height: 56),
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
            onSubmit: (String value) => _login(context),
          ),
          const SizedBox(height: 34),
          Row(
            children: <Widget>[
              RememberMeCheckBox(cubit: widget.cubit),
              const SizedBox(width: 8),
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
          const SizedBox(height: 34),
          AuthButton(
            buttonTitle: 'Log In',
            onPressed: () => _login(context),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Helper.keyboardUnfocus(context);
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
