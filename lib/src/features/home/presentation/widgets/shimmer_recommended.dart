import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/shimmer_hotel_card.dart';

class ShimmerRecommended extends StatelessWidget {
  const ShimmerRecommended({super.key});

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
            padding: EdgeInsets.only(
              top: SizeConfig.screenHeight! * 0.015,
              right: 26.w,
            ),
            child: GridView.builder(
              itemBuilder: (context, index) => ShimmerHotelCard(
                cardHeight: SizeConfig.screenHeight! * 0.24,
                cardWidth: SizeConfig.screenWidth! * 0.4,
              ),
              itemCount: 8,
              scrollDirection: Axis.vertical,
              reverse: false,
              primary: true,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              dragStartBehavior: DragStartBehavior.start,
              clipBehavior: Clip.hardEdge,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisExtent: 220,
                mainAxisSpacing: 20,
                crossAxisSpacing: 15,
                childAspectRatio: 3 / 2,
              ),
            ),
          ),
        );
      },
    );
  }
}
