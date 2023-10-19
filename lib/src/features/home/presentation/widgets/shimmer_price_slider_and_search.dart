import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_colors.dart';
import '/src/config/themes/cubit/themes_cubit.dart';

class ShimmerPriceSliderAndSearch extends StatelessWidget {
  const ShimmerPriceSliderAndSearch({super.key});

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
      },
    );
  }
}
