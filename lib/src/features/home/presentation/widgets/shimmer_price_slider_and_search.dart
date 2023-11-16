import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

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
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 11, left: 13, bottom: 11),
            margin: const EdgeInsets.only(right: 26),
            decoration: BoxDecoration(
              color: AppColors.shimmerContainerColor,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
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
