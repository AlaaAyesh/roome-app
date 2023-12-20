part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class SignOutSuccessState extends ProfileState {
  final int? uId;

  const SignOutSuccessState({required this.uId});
}

class SignOutErrorState extends ProfileState {
  final String error;

  const SignOutErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
