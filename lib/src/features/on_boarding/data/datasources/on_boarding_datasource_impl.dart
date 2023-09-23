import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/helpers/helper.dart';
import '../../../../core/utils/app_assets.dart';
import '../../domain/entities/on_boarding_entity.dart';
import '../models/on_boarding_model.dart';
import 'on_boarding_datasource.dart';

class OnBoardingDataSourceImpl implements OnBoardingDataSource {
  @override
  List<OnBoardingEntity> getPages() {
    return const [
      OnBoardingModel(
        image: AppAssets.imageOnBoarding1,
        heading: 'Plan Your Summer Vacation',
        subHeading: 'A group of hotels in the most beautiful places',
      ),
      OnBoardingModel(
        image: AppAssets.imageOnBoarding2,
        heading: 'Luxury Resorts',
        subHeading: 'Luxurious views for the summer',
      ),
      OnBoardingModel(
        image: AppAssets.imageOnBoarding3,
        heading: 'Enjoy The Most Beautiful Places',
        subHeading: ' Learn about the most important tourist places',
      ),
    ];
  }

  @override
  void navigateBetweenPages({
    required BuildContext context,
    required PageController pageController,
    required bool isLastBoarding,
  }) {
    if (isLastBoarding) navigateToLoginOrHome(context: context);

    pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  @override
  void navigateToLoginOrHome({required BuildContext context}) {
    if (Helper.uId == null) {
      Navigator.pushReplacementNamed(context, Routes.signInViewRoute);
    } else {
      Navigator.pushReplacementNamed(context, Routes.homeViewRoute);
    }
  }

  @override
  void previousPage({required PageController pageController}) {
    pageController.previousPage(
      duration: const Duration(seconds: 1),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }
}
