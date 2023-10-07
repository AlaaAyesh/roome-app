part of 'roome_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class RoomeInitial extends FavoriteState {}

class ChangeBottomNavState extends FavoriteState {
  final int index;

  const ChangeBottomNavState({required this.index});

  @override
  List<Object> get props => [index];
}

class ChangeBottomNavToHome extends FavoriteState {}

class GetUserDataLoadingState extends FavoriteState {}

class GetUserDataSuccessState extends FavoriteState {
  final UserModel userModel;

  const GetUserDataSuccessState({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class GetUserDataErrorState extends FavoriteState {
  final String error;

  const GetUserDataErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class SignOutSuccessState extends FavoriteState {
  final int? uId;

  const SignOutSuccessState({required this.uId});
}

class SignOutErrorState extends FavoriteState {
  final String error;

  const SignOutErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
