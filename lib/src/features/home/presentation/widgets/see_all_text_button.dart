import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_colors.dart';

class SeeAllTextButton extends StatelessWidget {
  const SeeAllTextButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        'See all',
        style: TextStyle(
          fontSize: 15.sp,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
