import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/separator_widget.dart';
import 'package:roome/src/features/home/data/models/offer_model.dart';
import 'package:roome/src/features/home/presentation/widgets/offer_card.dart';

class OffersList extends StatelessWidget {
  const OffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      width: double.infinity,
      child: ListView.separated(
        physics: AppConstants.physics,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: offers.length,
        itemBuilder: (context, index) => OfferCard(
          offerModel: offers[index],
          index: index,
        ),
        separatorBuilder: (context, index) => const SeparatorWidget(),
      ),
    );
  }
}
