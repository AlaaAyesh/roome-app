part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final int uId;

  const SignUpSuccessState({required this.uId});

  @override
  List<Object> get props => [uId];
}

class SignUpErrorState extends SignUpState {
  final String error;

  const SignUpErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class SwitchPassVisibleState extends SignUpState {
  final bool passVisibility;

  const SwitchPassVisibleState({required this.passVisibility});

  @override
  List<Object> get props => [passVisibility];
}

class SignUpWithGoogleLoadingState extends SignUpState {}

class SignUpWithGoogleSuccessState extends SignUpState {
  final String uId;

  const SignUpWithGoogleSuccessState({required this.uId});

  @override
  List<Object> get props => [uId];
}

class SignUpWithGoogleErrorState extends SignUpState {
  final String error;

  const SignUpWithGoogleErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
