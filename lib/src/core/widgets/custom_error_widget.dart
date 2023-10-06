import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:reusable_components/reusable_components.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    this.onPressed,
    required this.error,
  });

  final VoidCallback? onPressed;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Icon(
            Icons.warning,
            color: AppColors.primaryColor,
            size: 150.w,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 12.h),
          child: Flexible(
            child: Text(
              error,
              style: AppTextStyles.hintStyle.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        MyCustomButton(
          borderRadius: BorderRadius.all(Radius.circular(24.r)),
          height: 50.h,
          width: SizeConfig.screenWidth! * 0.55,
          backgroundColor: AppColors.primaryColor,
          elevation: 500.w,
          onPressed: () {
            if (onPressed != null) onPressed!();
          },
          hasPrefix: false,
          child: Center(
            child: Text(
              'Try again',
              style: AppTextStyles.appBarTextStyle.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
