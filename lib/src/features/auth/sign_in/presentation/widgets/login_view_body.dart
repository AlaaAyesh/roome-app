import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_navigator.dart';

import 'package:roome/src/features/auth/sign_in/presentation/cubit/login_cubit.dart';
import 'package:roome/src/features/auth/sign_in/presentation/widgets/login_form.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/widgets/auth_title.dart';
import '../../../../../core/widgets/have_account_or_not.dart';
import '../../../../../core/widgets/or_text.dart';
import '../../../../../core/widgets/login_with_social_buttons.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key, required this.cubit, required this.state});

  final LoginCubit cubit;
  final LoginState state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 38.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AuthTitle(
              title: 'Log in',
              margin: EdgeInsets.symmetric(vertical: 69.h),
            ),
            LoginForm(cubit: cubit, state: state),
            const OrText(),
            SizedBox(height: SizeConfig.screenHeight! * 0.016),
            LoginWithSocialButtons(
              googleOnTap: () => cubit.signInWithGoogle(),
              appleOnTap: () {
                // TODO: Login with Apple
              },
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.036),
            HaveAccountOrNot(
              onTap: () {
                context.navigateTo(routeName: Routes.signUpViewRoute);
              },
              buttonText: 'Sign up',
              question: "Don't have an account?",
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.015),
          ],
        ),
      ),
    );
  }
}
