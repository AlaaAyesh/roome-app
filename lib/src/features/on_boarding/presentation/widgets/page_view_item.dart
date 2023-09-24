import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/on_boarding/domain/entities/on_boarding_entity.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.pageInfo});

  final OnBoardingEntity pageInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.r)),
          child: Image.asset(
            pageInfo.image,
            height: SizeConfig.screenHeight! * 0.56,
            width: SizeConfig.screenWidth,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Text(
            pageInfo.heading,
            style: AppTextStyle.onBoardingHeadingTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 5.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            pageInfo.subHeading,
            style: AppTextStyle.textStyle15,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
