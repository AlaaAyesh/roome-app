import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/widgets/get_back_arrow.dart';
import 'package:roome/src/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:roome/src/features/auth/sign_up/presentation/widgets/sign_up_form.dart';

import '../../../../../core/widgets/auth_title.dart';
import '../../../../../core/widgets/have_account_or_not.dart';
import '../../../../../core/widgets/login_with_social_buttons.dart';
import '../../../../../core/widgets/or_text.dart';

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
            const GetBackArrow(),
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
                // TODO: Login with Apple
              },
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.03),
            HaveAccountOrNot(
              onTap: () => Navigator.pop(context),
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
