import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_constants.dart';
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
            height: 200.h,
            width: double.infinity,
            child: ListView.separated(
              physics: AppConstants.physics,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 5.w : 0),
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
          return Padding(
            padding: EdgeInsets.only(
              right: AppConstants.horizontalViewPaddingValue,
            ),
            child: TryAgainButton(
              onPressed: () =>
                  BlocProvider.of<NearMeCubit>(context).getNearMeHotels(),
            ),
          );
        } else {
          return const ShimmerNearMeHotels();
        }
      },
    );
  }
}
