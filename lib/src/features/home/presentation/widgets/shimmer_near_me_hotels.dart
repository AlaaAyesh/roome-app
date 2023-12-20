import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/separator_widget.dart';
import 'package:roome/src/core/widgets/shimmer_hotel_card.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNearMeHotels extends StatelessWidget {
  const ShimmerNearMeHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return Shimmer.fromColors(
          baseColor: state.brightness == Brightness.light
              ? AppColors.shimmerBaseColor
              : AppColors.darkShimmerBaseColor,
          highlightColor: state.brightness == Brightness.light
              ? AppColors.shimmerHighlightColor
              : AppColors.darkShimmerHighlightColor,
          enabled: true,
          child: SizedBox(
            height: 200.h,
            width: double.infinity,
            child: ListView.separated(
              physics: AppConstants.physics,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              itemBuilder: (context, index) => const ShimmerHotelCard(
                cardHeight: 170,
                cardWidth: 200,
              ),
              separatorBuilder: (context, index) => const SeparatorWidget(),
              itemCount: 8,
            ),
          ),
        );
      },
    );
  }
}
