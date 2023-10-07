import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../../core/widgets/separator_widget.dart';
import 'shimmer_explore_card.dart';

class ShimmerExploreList extends StatelessWidget {
  const ShimmerExploreList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.15,
      width: SizeConfig.screenWidth,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.screenHeight! * 0.01,
        ),
        itemBuilder: (context, index) => const ShimmerExploreCard(),
        separatorBuilder: (context, index) => const SeparatorWidget(),
        itemCount: 8,
      ),
    );
  }
}
