import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import 'custom_social_button.dart';

class LoginWithSocialButtons extends StatelessWidget {
  const LoginWithSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomSocialButton(
          onTap: () {},
          title: 'Google',
          icon: AppAssets.iconGoogleIcon,
        ),
        SizedBox(width: 45.w),
        CustomSocialButton(
          onTap: () {},
          title: 'Apple',
          icon: AppAssets.iconAppleIcon,
        ),
      ],
    );
  }
}
