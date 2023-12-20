import 'package:flutter/material.dart';
import 'package:roome/src/core/usecases/regular_usecase.dart';
import 'package:roome/src/features/onboarding/domain/repositories/on_boarding_repo.dart';

class PreviousPageUseCase implements RegularUseCases<void, PageController> {
  final OnBoardingRepo onBoardingRepo;

  const PreviousPageUseCase({required this.onBoardingRepo});

  @override
  void call(PageController params) {
    onBoardingRepo.previousPage(pageController: params);
  }
}
