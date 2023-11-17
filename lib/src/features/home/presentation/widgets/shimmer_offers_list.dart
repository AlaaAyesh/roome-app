import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/widgets/separator_widget.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerOffersList extends StatelessWidget {
  const ShimmerOffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        padding: EdgeInsets.zero,
        itemBuilder: (context, state) => BlocBuilder<ThemesCubit, ThemeData>(
          builder: (context, state) => Shimmer.fromColors(
            baseColor: state.brightness == Brightness.light
                ? AppColors.shimmerBaseColor
                : AppColors.darkShimmerBaseColor,
            highlightColor: state.brightness == Brightness.light
                ? AppColors.shimmerHighlightColor
                : AppColors.darkShimmerHighlightColor,
            enabled: true,
            child: Container(
              height: 130,
              width: 300,
              decoration: Helper.buildShimmerDecoration(state),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SeparatorWidget(),
      ),
    );
  }
}
