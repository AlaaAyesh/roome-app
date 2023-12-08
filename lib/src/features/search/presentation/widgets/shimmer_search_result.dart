import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        return ShimmerHotelCard(
          cardHeight: 200.h,
          cardWidth: double.infinity,
        );
      },
      separatorBuilder: (context, index) => SeparatorWidget(height: 15.h),
      itemCount: 8,
    );
  }
}
