import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class CustomSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    required String title,
    IconData icon = Icons.warning_rounded,
    Color backgroundColor = Colors.red,
    bool showCloseIcon = true,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
        content: Row(
          children: <Widget>[
            Icon(icon, color: Colors.white, size: 40.w),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: AppTextStyle.snackBarTitle,
                ),
                SizedBox(height: 5.h),
                Text(
                  message,
                  style: AppTextStyle.textStyle15.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        dismissDirection: DismissDirection.horizontal,
        showCloseIcon: showCloseIcon,
        closeIconColor: Colors.white,
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
