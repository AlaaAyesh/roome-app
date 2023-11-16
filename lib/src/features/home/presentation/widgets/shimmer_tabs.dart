import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
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
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 15,
                      width: 65,
                      decoration: Helper.buildShimmerDecoration(state),
                    ),
                    Container(
                      height: 15,
                      width: 130,
                      decoration: Helper.buildShimmerDecoration(state),
                    ),
                    Container(
                      height: 15,
                      width: 75,
                      decoration: Helper.buildShimmerDecoration(state),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const ShimmerNearMeHotels(),
                      const SizedBox(height: 5),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 26),
                          child: Container(
                            height: 12,
                            width: 70,
                            decoration: Helper.buildShimmerDecoration(state),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 15,
                            width: 85,
                            decoration: Helper.buildShimmerDecoration(state),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 26),
                            child: Container(
                              height: 12,
                              width: 70,
                              decoration: Helper.buildShimmerDecoration(state),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const ShimmerExploreList(),
                      const SizedBox(height: 20),
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
