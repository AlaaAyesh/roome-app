import 'package:flutter/material.dart';
import 'package:roome/src/features/on_boarding/domain/entities/on_boarding_entity.dart';

abstract class OnBoardingRepo {
  List<OnBoardingEntity> getPages();

  void navigateBetweenPages({
    required BuildContext context,
    required PageController pageController,
    required bool isLastBoarding,
  });

  void navigateToLoginOrHome({required BuildContext context});

  void previousPage({required PageController pageController});
}
