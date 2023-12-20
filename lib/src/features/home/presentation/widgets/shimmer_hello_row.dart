import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHelloRow extends StatelessWidget {
  const ShimmerHelloRow({super.key});

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
          child: Padding(
            padding: EdgeInsets.only(
              right: AppConstants.horizontalViewPaddingValue,
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 19.r,
                  backgroundColor: AppColors.shimmerContainerColor,
                ),
                SizedBox(width: 5.w),
                Container(
                  height: 12.h,
                  width: 120.w,
                  decoration: Helper.buildShimmerDecoration(state),
                ),
                const Spacer(),
                Container(
                  height: 10.h,
                  width: 90.w,
                  decoration: Helper.buildShimmerDecoration(state),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
