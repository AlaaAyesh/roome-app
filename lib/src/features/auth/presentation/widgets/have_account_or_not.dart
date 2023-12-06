import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

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
        TextButton(
          onPressed: onTap,
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
