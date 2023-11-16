import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:roome/src/core/widgets/hotel_card.dart';
import 'package:roome/src/core/widgets/try_again_button.dart';
import 'package:roome/src/features/home/presentation/cubits/recommended/recommended_cubit.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_recommended.dart';

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
            padding: const EdgeInsets.only(top: 15, right: 26),
            child: GridView.builder(
              itemBuilder: (context, index) =>
                  AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 475),
                columnCount: state.recommendedHotels.length,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: HotelCard(
                      hotel: state.recommendedHotels[index],
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
                mainAxisExtent: 200,
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
