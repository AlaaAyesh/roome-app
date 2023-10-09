import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:roome/src/features/roome/presentation/cubits/hotels/hotels_cubit.dart';

import 'package:roome/src/features/roome/presentation/widgets/popular_card.dart';

import '../../../../core/widgets/separator_widget.dart';

class ExploreSeeAllItems extends StatelessWidget {
  const ExploreSeeAllItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 15.h),
      shrinkWrap: true,
      itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 475),
        child: SlideAnimation(
          horizontalOffset: -150.w,
          curve: Curves.fastLinearToSlowEaseIn,
          child: FadeInAnimation(
            child: PopularCard(
              hotel: BlocProvider.of<HotelsCubit>(context).resultHotels[index],
            ),
          ),
        ),
      ),
      separatorBuilder: (context, index) => const SeparatorWidget(height: 33),
      itemCount: BlocProvider.of<HotelsCubit>(context).resultHotels.length,
    );
  }
}
