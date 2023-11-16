import 'package:flutter/material.dart';

import 'package:roome/src/core/widgets/separator_widget.dart';
import 'package:roome/src/core/widgets/shimmer_hotel_card.dart';

class ShimmerSearchResult extends StatelessWidget {
  const ShimmerSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      // Download all items at the same time
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const ShimmerHotelCard(
          cardHeight: 150,
          cardWidth: double.infinity,
        );
      },
      separatorBuilder: (context, index) => const SeparatorWidget(height: 15),
      itemCount: 8,
    );
  }
}
