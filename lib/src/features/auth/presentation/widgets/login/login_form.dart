import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/helpers/auth_helper.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:roome/src/features/auth/presentation/widgets/auth_button.dart';
import 'package:roome/src/features/auth/presentation/widgets/forgot_password_text_button.dart';
import 'package:roome/src/features/auth/presentation/widgets/reusable_pass_text_form_field.dart';
import 'package:roome/src/features/auth/presentation/widgets/reusable_text_form_field.dart';
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
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        LoginCubit cubit = BlocProvider.of<LoginCubit>(context);

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
                  AuthHelper.validatingNameField(
                    textName: 'Username or Email',
                    context: context,
                    value: value,
                  );
                  return null;
                },
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                autoFillHints: const <String>[
                  AutofillHints.email,
                  AutofillHints.name,
                ],
              ),
              const SizedBox(height: 56),
              ReusablePassTextField(
                controller: _passwordController,
                thisFocusNode: _passwordFocusNode,
                hint: 'Password',
                prefixIcon: Icons.lock,
                visibilityIcon: cubit.loginPassVisibility
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                visibilityButtonOnPressed: () => cubit.switchPassVisibility(),
                obscure: cubit.loginPassVisibility,
                validating: (String? value) {
                  AuthHelper.validatingPasswordField(
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
                  RememberMeCheckBox(cubit: cubit),
                  const SizedBox(width: 8),
                  Text(
                    'Remember Me',
                    style: AppTextStyles.textStyle14Medium,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ForgotPasswordTextButton(
                      onTap: () {},
                    ),
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
}
