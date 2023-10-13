import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class LocationTextButton extends StatelessWidget {
  const LocationTextButton({
    super.key,
    this.onPressed,
    required this.iconSize,
    required this.title,
  });

  final VoidCallback? onPressed;
  final double iconSize;

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.location_on_outlined,
            color: AppColors.primaryColor,
            size: iconSize,
          ),
          SizedBox(width: 5.w),
          Text(
            title,
            style: AppTextStyles.textStyle14Medium.copyWith(
              fontSize: 13.sp,
              color: AppColors.lightGrey.withOpacity(0.24),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
