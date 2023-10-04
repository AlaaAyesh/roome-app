part of 'roome_cubit.dart';

abstract class RoomeState extends Equatable {
  const RoomeState();

  @override
  List<Object> get props => [];
}

class RoomeInitial extends RoomeState {}

class ChangeBottomNavState extends RoomeState {
  final int index;

  const ChangeBottomNavState({required this.index});

  @override
  List<Object> get props => [index];
}

class ChangeBottomNavToHome extends RoomeState {}

class GetUserDataLoadingState extends RoomeState {}

class GetUserDataSuccessState extends RoomeState {
  final UserModel userModel;

  const GetUserDataSuccessState({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class GetUserDataErrorState extends RoomeState {
  final String error;

  const GetUserDataErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class SignOutSuccessState extends RoomeState {
  final int? uId;

  const SignOutSuccessState({required this.uId});
}

class SignOutErrorState extends RoomeState {
  final String error;

  const SignOutErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
