part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

class GetFavoritesLoadingState extends FavoriteState {}

class GetFavoritesSuccessState extends FavoriteState {
  final List<Hotel> favorites;

  const GetFavoritesSuccessState({required this.favorites});

  @override
  List<Object> get props => [favorites];
}

class GetFavoritesErrorState extends FavoriteState {
  final String error;

  const GetFavoritesErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class AddToFavLoadingState extends FavoriteState {}

class AddToFavSuccessState extends FavoriteState {
  final String message;

  const AddToFavSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class AddToFavErrorState extends FavoriteState {
  final String error;

  const AddToFavErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class RemoveFromFavLoadingState extends FavoriteState {}

class RemoveFromFavSuccessState extends FavoriteState {
  final String message;

  const RemoveFromFavSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class RemoveFromFavErrorState extends FavoriteState {
  final String error;

  const RemoveFromFavErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
