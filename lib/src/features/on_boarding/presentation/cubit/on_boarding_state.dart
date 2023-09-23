part of 'on_boarding_cubit.dart';

abstract class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

class OnBoardingInitial extends OnBoardingState {}

class PageViewIndexChangedState extends OnBoardingState {
  final int index;

  const PageViewIndexChangedState({required this.index});

  @override
  List<Object> get props => [index];
}

class SkipToSignInOrHome extends OnBoardingState {}

class NavigateBetweenPages extends OnBoardingState {}

class MoveToPreviousPage extends OnBoardingState {}
