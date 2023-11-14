import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/widgets/separator_widget.dart';
import 'package:roome/src/core/widgets/shimmer_hotel_card.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNearMeHotels extends StatelessWidget {
  const ShimmerNearMeHotels({super.key});

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
          child: SizedBox(
            height: SizeConfig.screenHeight! * 0.26,
            width: SizeConfig.screenWidth,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.screenHeight! * 0.01,
              ),
              itemBuilder: (context, index) => ShimmerHotelCard(
                cardHeight: SizeConfig.screenHeight! * 0.24,
                cardWidth: SizeConfig.screenWidth! * 0.55,
              ),
              separatorBuilder: (context, index) => const SeparatorWidget(),
              itemCount: 8,
            ),
          ),
        );
      },
    );
  }
}
