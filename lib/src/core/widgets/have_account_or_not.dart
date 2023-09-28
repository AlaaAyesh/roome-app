import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class HaveAccountOrNot extends StatelessWidget {
  const HaveAccountOrNot({
    super.key,
    required this.question,
    required this.buttonText,
    this.onTap,
  });

  final String question;
  final String buttonText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          question,
          style: AppTextStyles.textStyle15.copyWith(fontSize: 14.sp),
        ),
        SizedBox(width: 5.w),
        CustomTextButton(
          onTap: onTap,
          child: Text(
            buttonText,
            style: AppTextStyles.textStyle15.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
