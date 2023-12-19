import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_strings.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: AppColors.primaryColor,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        fontFamily: AppStrings.fontFamily,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          elevation: 0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 8.h,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50.0.r),
            ),
          ),
          dragHandleColor: AppColors.darkGrey.withOpacity(0.49),
          dragHandleSize: Size(50.w, 3.h),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        primaryColor: AppColors.primaryColor,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: AppStrings.fontFamily,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          elevation: 8.h,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50.0.r),
            ),
          ),
          dragHandleColor: AppColors.white60,
          dragHandleSize: Size(50.w, 3.h),
        ),
      );
}
