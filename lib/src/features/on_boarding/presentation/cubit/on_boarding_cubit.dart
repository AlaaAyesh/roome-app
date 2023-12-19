import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/entities/no_params.dart';
import 'package:roome/src/features/on_boarding/domain/entities/navigate_between_pages_params.dart';
import 'package:roome/src/features/on_boarding/domain/entities/on_boarding_entity.dart';
import 'package:roome/src/features/on_boarding/domain/usecases/get_onboarding_pages_usecase.dart';
import 'package:roome/src/features/on_boarding/domain/usecases/navigate_between_pages_usecase.dart';
import 'package:roome/src/features/on_boarding/domain/usecases/previous_page_usecase.dart';
import 'package:roome/src/features/on_boarding/domain/usecases/skip_to_login_usecase.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  final GetOnboardingPagesUseCase getPagesUseCase;
  final NavigateBetweenPagesUseCase navigateBetweenPagesUseCase;
  final SkipToLoginUseCase skipToLoginUseCase;
  final PreviousPageUseCase previousPageUseCase;

  OnBoardingCubit({
    required this.getPagesUseCase,
    required this.navigateBetweenPagesUseCase,
    required this.skipToLoginUseCase,
    required this.previousPageUseCase,
  }) : super(const OnBoardingInitial());

  bool isLastBoarding = false;

  List<OnBoardingEntity> getPages() {
    return getPagesUseCase.call(const NoParams());
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
    navigateBetweenPagesUseCase(
      NavigateBetweenPagesParams(
        context: context,
        pageController: pageController,
        isLastBoarding: isLastBoarding,
      ),
    );

    emit(const NavigateBetweenPages());
  }

  void skipToLogin({required BuildContext context}) {
    skipToLoginUseCase(context);

    emit(const SkipToLogin());
  }

  void previousPage({required PageController pageController}) {
    previousPageUseCase(pageController);

    emit(const MoveToPreviousPage());
  }
}
