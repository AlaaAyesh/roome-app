import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTextStyle {
  static TextStyle splashTextStyle = TextStyle(
    fontSize: 64.sp,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.primaryColor,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 2.w,
  );

  static TextStyle onBoardingHeadingTextStyle = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle onBoardingButtonStyle = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle onBoardingSubHeadingTextStyle = TextStyle(
    fontSize: 15.sp,
  );
}
