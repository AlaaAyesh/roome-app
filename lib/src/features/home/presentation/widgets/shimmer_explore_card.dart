import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            width: 130,
            decoration: BoxDecoration(
              color: AppColors.shimmerContainerColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1.15),
                  blurRadius: 6.89,
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
