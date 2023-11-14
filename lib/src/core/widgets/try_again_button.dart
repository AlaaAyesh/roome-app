import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class TryAgainButton extends StatelessWidget {
  const TryAgainButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MyCustomButton(
      borderRadius: BorderRadius.all(Radius.circular(24.r)),
      height: 45.h,
      width: SizeConfig.screenWidth! * 0.4,
      backgroundColor: AppColors.primaryColor,
      elevation: 500.w,
      onPressed: onPressed,
      hasPrefix: false,
      child: Center(
        child: Text(
          'Try again',
          style: AppTextStyles.textStyle15.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
