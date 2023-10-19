import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/widgets/separator_widget.dart';
import '/src/core/widgets/try_again_button.dart';
import '/src/features/home/presentation/cubits/hotels/hotels_cubit.dart';
import '/src/features/home/presentation/widgets/popular_card.dart';
import '/src/features/home/presentation/widgets/shimmer_popular.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelsCubit, HotelsState>(builder: (context, state) {
      if (state is GetHotelsLoadingState) {
        return const ShimmerPopular();
      } else if (state is GetHotelsSuccessState) {
        // return const ShimmerPopular();
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(right: 32.w, top: 15.h),
          shrinkWrap: true,
          itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 475),
            child: SlideAnimation(
              horizontalOffset: 150.w,
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                child: PopularCard(
                  hotel: state.hotels[index],
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) =>
              const SeparatorWidget(height: 33),
          reverse: true,
          itemCount: state.hotels.length,
        );
      } else if (state is GetHotelsErrorState) {
        return TryAgainButton(
            onPressed: () => BlocProvider.of<HotelsCubit>(context).getHotels());
      } else {
        return const ShimmerPopular();
      }
    });
  }
}
