import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/features/roome/presentation/widgets/shimmers/shimmer_hotel_card.dart';

import '../../../../../core/widgets/separator_widget.dart';

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
          cardHeight: SizeConfig.screenHeight! * 0.24,
          cardWidth: SizeConfig.screenWidth! * 0.55,
        );
      },
      separatorBuilder: (context, index) => SeparatorWidget(height: 15.h),
      itemCount: 8,
    );
  }
}
