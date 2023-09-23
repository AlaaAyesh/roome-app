import 'package:flutter/material.dart';
import 'package:roome/src/features/on_boarding/domain/entities/on_boarding_entity.dart';

import '../../data/models/on_boarding_model.dart';

abstract class OnBoardingRepo {
  List<OnBoardingEntity> getPages();

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
