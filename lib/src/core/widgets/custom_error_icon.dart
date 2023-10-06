import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomErrorIcon extends StatelessWidget {
  const CustomErrorIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.error,
      size: 22.w,
      color: AppColors.primaryColor,
    );
  }
}
