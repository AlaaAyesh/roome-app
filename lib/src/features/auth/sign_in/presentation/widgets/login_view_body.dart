import 'package:flutter/material.dart';

import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/widgets/auth_title.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/core/widgets/have_account_or_not.dart';
import 'package:roome/src/core/widgets/login_with_social_buttons.dart';
import 'package:roome/src/core/widgets/or_text.dart';
import 'package:roome/src/features/auth/sign_in/presentation/cubit/login_cubit.dart';
import 'package:roome/src/features/auth/sign_in/presentation/widgets/login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
    required this.cubit,
    required this.state,
  });

  final LoginCubit cubit;
  final LoginState state;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 38),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const AuthTitle(
                  title: 'Log in',
                  margin: EdgeInsets.symmetric(vertical: 69),
                ),
                LoginForm(cubit: cubit, state: state),
                const OrText(),
                const SizedBox(height: 14),
                LoginWithSocialButtons(
                  googleOnTap: () => cubit.signInWithGoogle(),
                  appleOnTap: () {
                    // TODO: Login with Apple
                  },
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: <Widget>[
              const Spacer(),
              HaveAccountOrNot(
                onTap: () {
                  context.navigateTo(routeName: Routes.signUpViewRoute);
                },
                buttonText: 'Sign up',
                question: "Don't have an account?",
              ),
              const BottomSpacer(),
            ],
          ),
        ),
      ],
    );
  }
}
