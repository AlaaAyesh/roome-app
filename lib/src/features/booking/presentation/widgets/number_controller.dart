import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_colors.dart';

class NumberController extends StatelessWidget {
  const NumberController({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31.h,
      width: 35.w,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.17),
        borderRadius: BorderRadius.all(Radius.circular(7.r)),
      ),
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Icon(
            icon,
            color: AppColors.primaryColor.withOpacity(0.74),
            size: 20.w,
          ),
        ),
      ),
    );
  }
}
