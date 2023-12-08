import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_constants.dart';
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
            height: 110.h,
            width: double.infinity,
            child: ListView.separated(
              physics: AppConstants.physics,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 5.w : 0),
                child: ExploreCard(
                  hotel: state.hotels[index],
                ),
              ),
              separatorBuilder: (context, index) => const SeparatorWidget(),
              itemCount: state.hotels.length,
            ),
          );
        } else if (state is GetHotelsErrorState) {
          return Padding(
            padding: EdgeInsets.only(
              right: AppConstants.horizontalViewPaddingValue,
            ),
            child: TryAgainButton(
              onPressed: () =>
                  BlocProvider.of<HotelsCubit>(context).getHotels(),
            ),
          );
        } else {
          return const ShimmerExploreList();
        }
      },
    );
  }
}
