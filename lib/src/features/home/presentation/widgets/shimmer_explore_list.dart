import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/separator_widget.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_explore_card.dart';

class ShimmerExploreList extends StatelessWidget {
  const ShimmerExploreList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      width: double.infinity,
      child: ListView.separated(
        physics: AppConstants.physics,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        itemBuilder: (context, index) => const ShimmerExploreCard(),
        separatorBuilder: (context, index) => const SeparatorWidget(),
        itemCount: 8,
      ),
    );
  }
}
