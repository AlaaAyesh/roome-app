import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:reusable_components/reusable_components.dart';

import 'package:roome/src/core/widgets/try_again_button.dart';

import 'package:roome/src/features/roome/presentation/widgets/shimmers/shimmer_near_me_hotels.dart';

import '../../../../core/widgets/separator_widget.dart';
import '../cubits/near_me/near_me_cubit.dart';
import 'hotel_card.dart';

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
            height: SizeConfig.screenHeight! * 0.26,
            width: SizeConfig.screenWidth,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.screenHeight! * 0.01,
              ),
              itemBuilder: (context, index) => HotelCard(
                hotel: state.nearMeHotels[index],
                cardHeight: SizeConfig.screenHeight! * 0.24,
                cardWidth: SizeConfig.screenWidth! * 0.55,
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
