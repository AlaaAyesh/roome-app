import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/widgets/auth_title.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/core/widgets/get_back_arrow.dart';
import 'package:roome/src/core/widgets/have_account_or_not.dart';
import 'package:roome/src/core/widgets/login_with_social_buttons.dart';
import 'package:roome/src/core/widgets/or_text.dart';
import 'package:roome/src/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:roome/src/features/auth/sign_up/presentation/widgets/sign_up_form.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({
    super.key,
    required this.cubit,
    required this.state,
  });

  final SignUpCubit cubit;
  final SignUpState state;

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
                GetBackArrow(onTap: () => context.getBack()),
                const AuthTitle(
                  title: 'Sign up',
                  margin: EdgeInsets.only(
                    top: 40,
                    bottom: 50,
                  ),
                ),
                SignUpForm(cubit: cubit, state: state),
                const OrText(),
                const SizedBox(height: 16),
                LoginWithSocialButtons(
                  googleOnTap: () {},
                  appleOnTap: () {
                    // TODO: Sign up with Apple
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
                onTap: () => context.getBack(),
                buttonText: 'Log in',
                question: 'Already have an account?',
              ),
              const BottomSpacer(),
            ],
          ),
        ),
      ],
    );
  }
}
