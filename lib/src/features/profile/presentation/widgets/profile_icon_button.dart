import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roome/src/core/utils/app_colors.dart';

class ProfileIconButton extends StatelessWidget {
  const ProfileIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.isNotBackIcon = false,
  });

  final String icon;
  final VoidCallback? onTap;
  final bool isNotBackIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.w,
        width: 32.w,
        padding: EdgeInsets.symmetric(horizontal: isNotBackIcon ? 2.w : 10.w),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.24),
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
        ),
        child: SvgPicture.asset(
          icon,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
