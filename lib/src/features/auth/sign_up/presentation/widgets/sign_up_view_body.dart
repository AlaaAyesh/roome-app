import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:roome/src/features/auth/sign_up/presentation/widgets/sign_up_form.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/auth_title.dart';
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
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(AppAssets.arrowLeftIcon),
            ),
            AuthTitle(
              title: 'Sign up',
              margin: EdgeInsets.only(
                top: 70.0.h,
                bottom: 49.h,
              ),
            ),
            SignUpForm(cubit: cubit, state: state),
            const OrText(),
            SizedBox(height: SizeConfig.screenHeight! * 0.016),
            LoginWithSocialButtons(
              googleOnTap: () => cubit.signUpWithGoogle(),
              appleOnTap: () {
                // TODO: Login with Apple
              },
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an account?",
                  style: AppTextStyle.textStyle15.copyWith(fontSize: 14.sp),
                ),
                SizedBox(width: 5.w),
                CustomTextButton(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    'Log in',
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
