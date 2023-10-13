import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_colors.dart';

class ShimmerExploreCard extends StatelessWidget {
  const ShimmerExploreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      enabled: true,
      child: Container(
        height: SizeConfig.screenHeight! * 0.15,
        width: SizeConfig.screenWidth! * 0.4,
        decoration: BoxDecoration(
          color: AppColors.shimmerContainerColor,
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1.15.w),
              blurRadius: 6.89.w,
              color: AppColors.shadowColor,
            ),
          ],
        ),
      ),
    );
  }
}
