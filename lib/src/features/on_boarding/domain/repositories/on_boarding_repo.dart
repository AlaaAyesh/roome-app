import 'package:flutter/material.dart';
import 'package:roome/src/features/on_boarding/domain/entities/navigate_between_pages_params.dart';
import 'package:roome/src/features/on_boarding/domain/entities/on_boarding_entity.dart';

abstract class OnBoardingRepo {
  List<OnBoardingEntity> getPages();

  void navigateBetweenPages({
    required NavigateBetweenPagesParams params,
  });

  void skipToLogin({required BuildContext context});

  void previousPage({required PageController pageController});
}
