import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/widgets/separator_widget.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPopular extends StatelessWidget {
  const ShimmerPopular({super.key});

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
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.shimmerContainerColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: AppColors.borderColor,
                  width: 1,
                ),
              ),
            ),
            separatorBuilder: (context, index) =>
                const SeparatorWidget(height: 33),
            itemCount: 8,
          ),
        );
      },
    );
  }
}
