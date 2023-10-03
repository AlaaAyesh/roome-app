import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import '/src/core/utils/app_text_styles.dart';
import 'explore_list.dart';
import 'hotels_list.dart';
import 'offers_list.dart';
import 'see_all_text_button.dart';

class NearMe extends StatelessWidget {
  const NearMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: SeeAllTextButton(
              onTap: () {},
            ),
          ),
          const HotelsList(),
          SizedBox(height: SizeConfig.screenHeight! * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Explore',
                style: AppTextStyles.hintStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SeeAllTextButton(
                onTap: () {},
              )
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.011),
          const ExploreList(),
          SizedBox(height: SizeConfig.screenHeight! * 0.02),
          const OffersList(),
        ],
      ),
    );
  }
}
