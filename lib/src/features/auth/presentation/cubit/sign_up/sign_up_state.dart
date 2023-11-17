part of '../../../presentation/cubit/sign_up/sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final int uId;
  final UserModel userModel;

  const SignUpSuccessState({required this.uId, required this.userModel});

  @override
  List<Object> get props => [uId, userModel];
}

class SignUpErrorState extends SignUpState {
  final String error;

  const SignUpErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class SwitchSignUpPassVisibleState extends SignUpState {
  final bool signUpPassVisibility;

  const SwitchSignUpPassVisibleState({required this.signUpPassVisibility});

  @override
  List<Object> get props => [signUpPassVisibility];
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
