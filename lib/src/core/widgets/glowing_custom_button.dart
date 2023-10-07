import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class GlowingCustomButton extends StatelessWidget {
  const GlowingCustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return MyCustomButton(
      onPressed: onPressed,
      height: 50.h,
      width: 148.w,
      borderRadius: BorderRadius.all(Radius.circular(12.r)),
      backgroundColor: AppColors.primaryColor,
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 4.93.w),
          blurRadius: 18.49.w,
          color: AppColors.primaryColor.withOpacity(0.56),
        ),
      ],
      hasPrefix: false,
      child: Center(
        child: Text(
          buttonText,
          style: AppTextStyles.textStyle15.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
