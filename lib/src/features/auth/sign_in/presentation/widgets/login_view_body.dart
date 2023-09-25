import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/routes/app_routes.dart';

import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/auth/sign_in/presentation/cubit/login_cubit.dart';
import 'package:roome/src/features/auth/sign_in/presentation/widgets/login_form.dart';

import '../../../../../core/widgets/auth_title.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?",
                  style: AppTextStyle.textStyle15.copyWith(fontSize: 14.sp),
                ),
                SizedBox(width: 5.w),
                CustomTextButton(
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.signUpViewRoute),
                  child: Text(
                    'Sign up',
                    style: AppTextStyle.textStyle15.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.015),
          ],
        ),
      ),
    );
  }
}
