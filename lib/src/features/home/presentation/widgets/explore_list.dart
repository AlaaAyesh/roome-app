import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            height: 110,
            width: double.infinity,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 5 : 0),
                child: ExploreCard(
                  hotel: state.hotels[index],
                ),
              ),
              separatorBuilder: (context, index) => const SeparatorWidget(),
              itemCount: state.hotels.length,
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
