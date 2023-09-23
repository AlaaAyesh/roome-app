import 'package:flutter/material.dart';

import '../../domain/entities/on_boarding_entity.dart';

abstract class OnBoardingDataSource {
  List<OnBoardingEntity> getPages();

  void navigateBetweenPages({
    required BuildContext context,
    required PageController pageController,
    required bool isLastBoarding,
  });

  void navigateToLoginOrHome({required BuildContext context});

  void previousPage({required PageController pageController});
}
