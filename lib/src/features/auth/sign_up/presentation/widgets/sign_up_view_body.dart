import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/widgets/auth_title.dart';
import 'package:roome/src/core/widgets/get_back_arrow.dart';
import 'package:roome/src/core/widgets/have_account_or_not.dart';
import 'package:roome/src/core/widgets/login_with_social_buttons.dart';
import 'package:roome/src/core/widgets/or_text.dart';
import 'package:roome/src/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:roome/src/features/auth/sign_up/presentation/widgets/sign_up_form.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key, required this.cubit, required this.state});

  final SignUpCubit cubit;
  final SignUpState state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 70.h, horizontal: 38.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GetBackArrow(onTap: () => context.getBack()),
            AuthTitle(
              title: 'Sign up',
              margin: EdgeInsets.only(
                top: SizeConfig.screenHeight! * 0.04,
                bottom: SizeConfig.screenHeight! * 0.05,
              ),
            ),
            SignUpForm(cubit: cubit, state: state),
            const OrText(),
            SizedBox(height: SizeConfig.screenHeight! * 0.016),
            LoginWithSocialButtons(
              googleOnTap: () {},
              appleOnTap: () {
                // TODO: Sign up with Apple
              },
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.075),
            HaveAccountOrNot(
              onTap: () => context.getBack(),
              buttonText: 'Log in',
              question: 'Already have an account?',
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.015),
          ],
        ),
      ),
    );
  }
}
