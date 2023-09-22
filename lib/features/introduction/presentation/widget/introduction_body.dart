import 'package:flutter/cupertino.dart';
import 'package:roome/core/global/app_assets.dart';
import 'package:roome/features/introduction/presentation/widget/introduction_slid.dart';

List<Widget> introductionBody() {
  return const [
    IntroSlid(
      introImage: kIntroductionImage1,
      introTitle: 'Plan Your Summer Vacation',
      introSubTitle:
      'A group of hotels in the most beatiful places',
    ),
    IntroSlid(
      introImage: kIntroductionImage2,
      introTitle: 'Luxury Resorts',
      introSubTitle: 'Luxurios views for the summer',
    ),
    IntroSlid(
      introImage: kIntroductionImage3,
      introTitle: 'Enjoy The Most Beautiful Places',
      introSubTitle:
      'Learn about the most important tourist places',
    ),
  ];
}
