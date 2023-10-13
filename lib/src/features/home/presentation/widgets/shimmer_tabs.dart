import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_explore_list.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_near_me_hotels.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_colors.dart';

class ShimmerTabs extends StatelessWidget {
  const ShimmerTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: Padding(
        padding: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 15.h,
                  width: 65.w,
                  decoration: Helper.buildShimmerDecoration(),
                ),
                Container(
                  height: 15.h,
                  width: 130.w,
                  decoration: Helper.buildShimmerDecoration(),
                ),
                Container(
                  height: 15.h,
                  width: 75.w,
                  decoration: Helper.buildShimmerDecoration(),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.008),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const ShimmerNearMeHotels(),
                  SizedBox(height: SizeConfig.screenHeight! * 0.005),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Padding(
                      padding: EdgeInsets.only(right: 26.w),
                      child: Container(
                        height: 12.h,
                        width: 70.w,
                        decoration: Helper.buildShimmerDecoration(),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 15.h,
                        width: 85.w,
                        decoration: Helper.buildShimmerDecoration(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 26.w),
                        child: Container(
                          height: 12.h,
                          width: 70.w,
                          decoration: Helper.buildShimmerDecoration(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.011),
                  const ShimmerExploreList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
