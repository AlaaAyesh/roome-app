import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHotelCard extends StatelessWidget {
  const ShimmerHotelCard({
    super.key,
    this.cardHeight,
    this.cardWidth,
  });

  final double? cardHeight;
  final double? cardWidth;

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
            height: cardHeight,
            width: cardWidth,
            decoration: BoxDecoration(
              color: AppColors.shimmerContainerColor,
              borderRadius: const BorderRadius.all(Radius.circular(13)),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1.73),
                  blurRadius: 10,
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
