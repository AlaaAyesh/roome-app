import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_colors.dart';
import '/src/config/themes/cubit/themes_cubit.dart';

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
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return Shimmer.fromColors(
          baseColor: state.brightness == Brightness.light
              ? AppColors.shimmerBaseColor
              : AppColors.darkShimmerBaseColor,
          highlightColor: state.brightness == Brightness.light
              ? AppColors.shimmerHighlightColor
              : AppColors.darkShimmerHighlightColor,
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
      },
    );
  }
}
