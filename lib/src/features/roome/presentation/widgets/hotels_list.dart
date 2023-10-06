import 'package:flutter/material.dart';

import 'package:reusable_components/reusable_components.dart';

import '../../../../core/widgets/separator_widget.dart';
import 'hotel_card.dart';

class HotelsList extends StatelessWidget {
  const HotelsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.26,
      width: SizeConfig.screenWidth,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.screenHeight! * 0.01,
        ),
        itemBuilder: (context, index) => HotelCard(
          cardHeight: SizeConfig.screenHeight! * 0.24,
          cardWidth: SizeConfig.screenWidth! * 0.55,
        ),
        separatorBuilder: (context, index) => const SeparatorWidget(),
        itemCount: 5,
      ),
    );
  }
}
