import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/auth/sign_in/presentation/widgets/login_form.dart';

import '../../../../../core/widgets/auth_title.dart';
import 'login_with_social_buttons.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 70.h, horizontal: 38.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SvgPicture.asset(AppAssets.arrowLeftIcon),
            const AuthTitle(title: 'Log in'),
            const LoginForm(),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Or',
                style: AppTextStyle.textStyle15.copyWith(fontSize: 14),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.016),
            const LoginWithSocialButtons(),
            SizedBox(height: SizeConfig.screenHeight! * 0.036),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?",
                  style: AppTextStyle.textStyle15.copyWith(fontSize: 14),
                ),
                SizedBox(width: 10.w),
                CustomTextButton(
                  onTap: () {
                    /// TODO:
                  },
                  child: Text(
                    'Sign up',
                    style: AppTextStyle.textStyle15.copyWith(
                      fontSize: 14,
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
