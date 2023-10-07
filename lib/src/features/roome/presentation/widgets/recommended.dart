import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reusable_components/reusable_components.dart';

import 'package:roome/src/core/widgets/try_again_button.dart';

import 'package:roome/src/features/roome/presentation/widgets/hotel_card.dart';
import 'package:roome/src/features/roome/presentation/widgets/shimmers/shimmer_recommended.dart';

import '../cubits/recommended/recommended_cubit.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedCubit, RecommendedState>(
      builder: (context, state) {
        if (state is GetRecommendedHotelsLoadingState) {
          return const ShimmerRecommended();
        } else if (state is GetRecommendedHotelsSuccessState) {
          return Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.screenHeight! * 0.015,
              right: 26.w,
            ),
            child: GridView.builder(
              itemBuilder: (context, index) =>
                  AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 600),
                columnCount: state.recommendedHotels.length,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: HotelCard(
                      hotel: state.recommendedHotels[index],
                      cardHeight: SizeConfig.screenHeight! * 0.24,
                      cardWidth: SizeConfig.screenWidth! * 0.4,
                    ),
                  ),
                ),
              ),
              itemCount: state.recommendedHotels.length,
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
          );
        } else if (state is GetRecommendedHotelsErrorState) {
          return TryAgainButton(
            onPressed: () => BlocProvider.of<RecommendedCubit>(context)
                .getRecommendedHotels(),
          );
        } else {
          return const ShimmerRecommended();
        }
      },
    );
  }
}
