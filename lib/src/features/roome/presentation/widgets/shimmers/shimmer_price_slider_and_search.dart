import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/app_colors.dart';

class ShimmerPriceSliderAndSearch extends StatelessWidget {
  const ShimmerPriceSliderAndSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      enabled: true,
      child: Container(
        height: 153.h,
        width: 384.w,
        padding: EdgeInsets.only(top: 11.h, left: 13.w),
        margin: EdgeInsets.only(right: 26.w),
        decoration: BoxDecoration(
          color: AppColors.shimmerContainerColor,
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          border: Border.all(
            color: AppColors.borderColor,
          ),
        ),
      ),
    );
  }
}
