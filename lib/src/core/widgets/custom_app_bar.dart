import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_text_styles.dart';
import 'get_back_arrow.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.spaceBetween,
    required this.title,
    required this.arrowOnTap,
  });

  final double spaceBetween;
  final VoidCallback arrowOnTap;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GetBackArrow(onTap: arrowOnTap),
        SizedBox(width: spaceBetween.w),
        Text(
          title,
          style: AppTextStyles.appBarTextStyle,
        ),
      ],
    );
  }
}
