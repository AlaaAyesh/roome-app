import 'package:flutter/material.dart';
import 'package:roome/src/core/widgets/separator_widget.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_explore_card.dart';

class ShimmerExploreList extends StatelessWidget {
  const ShimmerExploreList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: double.infinity,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) => const ShimmerExploreCard(),
        separatorBuilder: (context, index) => const SeparatorWidget(),
        itemCount: 8,
      ),
    );
  }
}
