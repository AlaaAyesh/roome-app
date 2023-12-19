import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/onboarding/domain/entities/on_boarding_entity.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.pageInfo});

  final OnBoardingEntity pageInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.r)),
            child: Image.asset(
              pageInfo.image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 56.h),
        Text(
          pageInfo.heading,
          style: AppTextStyles.onBoardingHeadingTextStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5.h),
        Text(
          pageInfo.subHeading,
          style: AppTextStyles.textStyle15,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
