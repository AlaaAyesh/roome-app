import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/features/on_boarding/domain/entities/on_boarding_entity.dart';
import 'package:roome/src/features/on_boarding/domain/repositories/on_boarding_repo.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  final OnBoardingRepo onBoardingRepo;

  OnBoardingCubit({required this.onBoardingRepo}) : super(OnBoardingInitial());

  bool isLastBoarding = false;

  List<OnBoardingEntity> getPages() {
    return onBoardingRepo.getPages();
  }

  void onChangePageIndex(int index) {
    if (index == getPages().length - 1) {
      isLastBoarding = true;
    } else {
      isLastBoarding = false;
    }
    emit(PageViewIndexChangedState(index: index));
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

    emit(NavigateBetweenPages());
  }

  void navigateToLoginOrHome({required BuildContext context}) {
    onBoardingRepo.navigateToLoginOrHome(context: context);

    emit(SkipToSignInOrHome());
  }

  void previousPage({required PageController pageController}) {
    onBoardingRepo.previousPage(pageController: pageController);

    emit(MoveToPreviousPage());
  }
}
