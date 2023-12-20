import 'package:flutter/material.dart';
import 'package:roome/src/core/usecases/regular_usecase.dart';
import 'package:roome/src/features/onboarding/domain/repositories/on_boarding_repo.dart';

class SkipToLoginUseCase implements RegularUseCases<void, BuildContext> {
  final OnBoardingRepo onBoardingRepo;

  const SkipToLoginUseCase({required this.onBoardingRepo});

  @override
  void call(BuildContext params) {
    onBoardingRepo.skipToLogin(context: params);
  }
}
