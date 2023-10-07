import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/app_colors.dart';

class ShimmerHotelCard extends StatelessWidget {
  const ShimmerHotelCard({
    super.key,
    required this.cardHeight,
    required this.cardWidth,
  });

  final double cardHeight;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      enabled: true,
      child: Container(
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
          color: AppColors.shimmerContainerColor,
          borderRadius: BorderRadius.all(Radius.circular(13.r)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1.73.w),
              blurRadius: 10.w,
              color: AppColors.shadowColor,
            ),
          ],
        ),
      ),
    );
  }
}
