import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class LocationText extends StatelessWidget {
  const LocationText({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on_outlined,
          color: AppColors.primaryColor,
          size: 16.w,
        ),
        SizedBox(width: 5.w),
        Flexible(
          child: Text(
            location,
            style: AppTextStyles.textStyle14Medium.copyWith(
              fontSize: 13.sp,
              color: AppColors.lightGrey.withOpacity(0.24),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
