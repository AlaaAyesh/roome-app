import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_colors.dart';

class AppTextStyles {
  static TextStyle splashTextStyle = const TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.primaryColor,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 2,
    color: Colors.black,
  );

  static TextStyle onBoardingHeadingTextStyle = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
  );

  static TextStyle onBoardingButtonStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle appBarTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black.withOpacity(0.89),
  );

  static TextStyle snackBarTitle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle hintStyle = const TextStyle(
    fontSize: 16,
    color: AppColors.hintColor,
  );

  static TextStyle textStyle15 = const TextStyle(
    fontSize: 15,
  );

  static TextStyle textStyle14Medium = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyle12 = const TextStyle(
    fontSize: 12,
  );

  static TextStyle bottomNavTextStyle = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
}
