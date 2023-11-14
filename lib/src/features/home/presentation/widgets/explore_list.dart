import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/widgets/separator_widget.dart';
import 'package:roome/src/core/widgets/try_again_button.dart';
import 'package:roome/src/features/home/presentation/cubits/hotels/hotels_cubit.dart';
import 'package:roome/src/features/home/presentation/widgets/explore_card.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_explore_list.dart';

class ExploreList extends StatelessWidget {
  const ExploreList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelsCubit, HotelsState>(
      builder: (context, state) {
        if (state is GetHotelsLoadingState) {
          return const ShimmerExploreList();
        } else if (state is GetHotelsSuccessState) {
          return SizedBox(
            height: SizeConfig.screenHeight! * 0.15,
            width: SizeConfig.screenWidth,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.screenHeight! * 0.01,
              ),
              itemBuilder: (context, index) => ExploreCard(
                hotel: state.hotels[index],
              ),
              separatorBuilder: (context, index) => const SeparatorWidget(),
              itemCount: 3,
            ),
          );
        } else if (state is GetHotelsErrorState) {
          return TryAgainButton(
            onPressed: () => BlocProvider.of<HotelsCubit>(context).getHotels(),
          );
        } else {
          return const ShimmerExploreList();
        }
      },
    );
  }
}
