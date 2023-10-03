import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../data/models/offer_model.dart';
import 'offer_card.dart';

class OffersList extends StatelessWidget {
  const OffersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.13,
      width: SizeConfig.screenWidth! * 0.85,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: offers.length,
        itemBuilder: (context, index) => OfferCard(
          offerModel: offers[index],
          index: index,
        ),
      ),
    );
  }
}
