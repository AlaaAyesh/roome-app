import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_explore_list.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_near_me_hotels.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_offers_list.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTabs extends StatelessWidget {
  const ShimmerTabs({super.key});

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
          child: Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 15.h,
                      width: 65.w,
                      decoration: Helper.buildShimmerDecoration(state),
                    ),
                    Container(
                      height: 15.h,
                      width: 130.w,
                      decoration: Helper.buildShimmerDecoration(state),
                    ),
                    Container(
                      height: 15.h,
                      width: 75.w,
                      decoration: Helper.buildShimmerDecoration(state),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const ShimmerNearMeHotels(),
                      SizedBox(height: 5.h),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: AppConstants.horizontalViewPaddingValue,
                          ),
                          child: Container(
                            height: 12.h,
                            width: 70.w,
                            decoration: Helper.buildShimmerDecoration(state),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 15.h,
                            width: 85.w,
                            decoration: Helper.buildShimmerDecoration(state),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: AppConstants.horizontalViewPaddingValue,
                            ),
                            child: Container(
                              height: 12.h,
                              width: 70.w,
                              decoration: Helper.buildShimmerDecoration(state),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      const ShimmerExploreList(),
                      SizedBox(height: 20.h),
                      const ShimmerOffersList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
