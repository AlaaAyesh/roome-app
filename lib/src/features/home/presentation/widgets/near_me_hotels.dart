import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/widgets/hotel_card.dart';
import 'package:roome/src/core/widgets/separator_widget.dart';
import 'package:roome/src/core/widgets/try_again_button.dart';
import 'package:roome/src/features/home/presentation/cubits/near_me/near_me_cubit.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_near_me_hotels.dart';

class NearMeHotels extends StatelessWidget {
  const NearMeHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NearMeCubit, NearMeState>(
      builder: (context, state) {
        if (state is GetNearMeHotelsLoadingState) {
          return const ShimmerNearMeHotels();
        } else if (state is GetNearMeHotelsSuccessState) {
          return SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 5 : 0),
                child: HotelCard(
                  hotel: state.nearMeHotels[index],
                  cardHeight: 170,
                  cardWidth: 200,
                ),
              ),
              separatorBuilder: (context, index) => const SeparatorWidget(),
              itemCount: state.nearMeHotels.length,
            ),
          );
        } else if (state is GetNearMeHotelsErrorState) {
          return TryAgainButton(
            onPressed: () =>
                BlocProvider.of<NearMeCubit>(context).getNearMeHotels(),
          );
        } else {
          return const ShimmerNearMeHotels();
        }
      },
    );
  }
}
