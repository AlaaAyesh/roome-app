import 'package:flutter/material.dart';
import 'package:roome/src/config/router/routes.dart';
import 'package:roome/src/core/helpers/cache_helper.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/service_locator.dart';
import 'package:roome/src/features/on_boarding/data/datasources/on_boarding_datasource.dart';
import 'package:roome/src/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:roome/src/features/on_boarding/domain/entities/navigate_between_pages_params.dart';
import 'package:roome/src/features/on_boarding/domain/entities/on_boarding_entity.dart';

class OnBoardingDataSourceImpl implements OnBoardingDataSource {
  @override
  List<OnBoardingEntity> getPages() {
    return const <OnBoardingModel>[
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
        heading: 'Enjoy Our Beautiful Places',
        subHeading: ' Learn about the most important tourist places',
      ),
    ];
  }

  @override
  void navigateBetweenPages({
    required NavigateBetweenPagesParams params,
  }) {
    if (params.isLastBoarding) skipToLogin(context: params.context);

    params.pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  @override
  void skipToLogin({required BuildContext context}) {
    getIt
        .get<CacheHelper>()
        .saveData(key: 'onBoarding', value: true)
        .then((value) {
      if (value) {
        context.navigateAndReplacement(newRoute: Routes.loginViewRoute);
      }
    });
  }

  @override
  void previousPage({required PageController pageController}) {
    pageController.previousPage(
      duration: const Duration(seconds: 1),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }
}
