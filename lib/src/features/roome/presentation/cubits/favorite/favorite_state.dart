part of 'favorite_cubit.dart';

sealed class FavoriteStates extends Equatable {
  const FavoriteStates();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteStates {}

class GetFavoritesLoadingState extends FavoriteStates {}

class GetFavoritesSuccessState extends FavoriteStates {
  final List<Hotel> favorites;

  const GetFavoritesSuccessState({required this.favorites});

  @override
  List<Object> get props => [favorites];
}

class GetFavoritesErrorState extends FavoriteStates {
  final String error;

  const GetFavoritesErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class AddToFavLoadingState extends FavoriteStates {}

class AddToFavSuccessState extends FavoriteStates {
  final String message;

  const AddToFavSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class AddToFavErrorState extends FavoriteStates {
  final String error;

  const AddToFavErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class RemoveFromFavLoadingState extends FavoriteStates {}

class RemoveFromFavSuccessState extends FavoriteStates {
  final String message;

  const RemoveFromFavSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class RemoveFromFavErrorState extends FavoriteStates {
  final String error;

  const RemoveFromFavErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
