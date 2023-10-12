import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';

class ProfileIconButton extends StatelessWidget {
  const ProfileIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.isNotification = false,
  });

  final String icon;
  final VoidCallback? onTap;
  final bool isNotification;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.w,
        width: 32.w,
        padding: EdgeInsets.symmetric(horizontal: isNotification ? 4.w : 10.w),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.24),
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
