import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 69.h),
      child: Text(
        title,
        style: AppTextStyle.onBoardingButtonStyle.copyWith(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
