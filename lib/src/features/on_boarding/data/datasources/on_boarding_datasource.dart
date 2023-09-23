import 'package:flutter/material.dart';
import 'package:roome/src/config/routes/app_routes.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/features/on_boarding/data/models/on_boarding_model.dart';

abstract class OnBoardingDataSource {
  List<OnBoardingModel> getPages();

  void onChangePageIndex({
    required int index,
    required List<OnBoardingModel> pages,
    required bool isLastBoarding,
  });

  void navigateBetweenPages({
    required BuildContext context,
    required PageController pageController,
    required bool isLastBoarding,
  });

  void navigateToAuth({required BuildContext context});
}

class OnBoardingDataSourceImpl implements OnBoardingDataSource {
  @override
  List<OnBoardingModel> getPages() {
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
    if (isLastBoarding) navigateToAuth(context: context);

    pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  @override
  void navigateToAuth({required BuildContext context}) {
    Navigator.pushReplacementNamed(context, Routes.signInViewRoute);
  }

  @override
  void onChangePageIndex({
    required int index,
    required List<OnBoardingModel> pages,
    required bool isLastBoarding,
  }) {
    if (index == pages.length - 1) {
      isLastBoarding = true;
    } else {
      isLastBoarding = false;
    }
  }
}
