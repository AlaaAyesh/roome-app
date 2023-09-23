import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:roome/src/features/on_boarding/domain/repositories/on_boarding_repo.dart';

import '../../data/models/on_boarding_model.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  final OnBoardingRepo onBoardingRepo;

  OnBoardingCubit({required this.onBoardingRepo}) : super(OnBoardingInitial());

  bool isLastBoarding = false;

  void onChangePageIndex({
    required int index,
    required List<OnBoardingModel> pages,
  }) {
    onBoardingRepo.onChangePageIndex(
      index: index,
      pages: pages,
      isLastBoarding: isLastBoarding,
    );

    emit(PageViewIndexChangedState());
  }

  void navigateBetweenPages({
    required BuildContext context,
    required PageController pageController,
  }) {
    onBoardingRepo.navigateBetweenPages(
      context: context,
      pageController: pageController,
      isLastBoarding: isLastBoarding,
    );

    emit(PageViewIndexChangedState());
  }

  void navigateToAuth({required BuildContext context}) {
    onBoardingRepo.navigateToAuth(context: context);

    emit(GetToAuthScreenState());
  }
}
