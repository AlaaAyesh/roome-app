import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
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
            padding: const EdgeInsets.only(right: 26),
            child: Row(
              children: <Widget>[
                Container(
                  height: 25,
                  width: 25,
                  decoration: Helper.buildShimmerDecoration(state),
                ),
                const SizedBox(width: 16),
                const CircleAvatar(
                  radius: 19,
                  backgroundColor: AppColors.shimmerContainerColor,
                ),
                const SizedBox(width: 5),
                Container(
                  height: 10,
                  width: 120,
                  decoration: Helper.buildShimmerDecoration(state),
                ),
                const Spacer(),
                Container(
                  height: 10,
                  width: 90,
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
