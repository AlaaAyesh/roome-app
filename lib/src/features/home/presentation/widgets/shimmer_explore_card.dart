import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerExploreCard extends StatelessWidget {
  const ShimmerExploreCard({super.key});

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
      },
    );
  }
}
