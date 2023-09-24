import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import 'custom_social_button.dart';

class LoginWithSocialButtons extends StatelessWidget {
  const LoginWithSocialButtons({
    super.key,
    this.googleOnTap,
    this.appleOnTap,
  });

  final VoidCallback? googleOnTap;
  final VoidCallback? appleOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomSocialButton(
          onTap: googleOnTap,
          title: 'Google',
          icon: AppAssets.iconGoogleIcon,
        ),
        SizedBox(width: 45.w),
        CustomSocialButton(
          onTap: appleOnTap,
          title: 'Apple',
          icon: AppAssets.iconAppleIcon,
        ),
      ],
    );
  }
}
