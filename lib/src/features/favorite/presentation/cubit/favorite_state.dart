part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {
  const FavoriteInitial();
}

class GetFavoritesLoadingState extends FavoriteState {
  const GetFavoritesLoadingState();
}

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

class AddToFavLoadingState extends FavoriteState {
  const AddToFavLoadingState();
}

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

class RemoveFromFavLoadingState extends FavoriteState {
  const RemoveFromFavLoadingState();
}

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
