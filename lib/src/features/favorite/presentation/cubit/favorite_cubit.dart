import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/models/hotel.dart';
import 'package:roome/src/features/favorite/domain/entities/fav_params.dart';
import 'package:roome/src/features/favorite/domain/usecases/add_to_fav_usecase.dart';
import 'package:roome/src/features/favorite/domain/usecases/get_favorites_usecase.dart';
import 'package:roome/src/features/favorite/domain/usecases/remove_from_fav_usecase.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final GetFavoritesUseCase getFavoritesUseCase;
  final AddToFavUseCase addToFavUseCase;
  final RemoveFromFavUseCase removeFromFavUseCase;

  FavoriteCubit({
    required this.getFavoritesUseCase,
    required this.addToFavUseCase,
    required this.removeFromFavUseCase,
  }) : super(FavoriteInitial());

  List<Hotel> favoriteHotels = <Hotel>[];

  void getFavorites() {
    emit(GetFavoritesLoadingState());

    getFavoritesUseCase(Helper.uId).then((value) {
      value.fold(
        (failure) {
          emit(GetFavoritesErrorState(error: failure.errorMessage.toString()));
        },
        (favorites) {
          favoriteHotels = favorites;
          emit(GetFavoritesSuccessState(favorites: favorites));
        },
      );
    });
  }

  void addToFav({required int hotelId}) {
    emit(AddToFavLoadingState());

    addToFavUseCase(FavParams(uId: Helper.uId!, hotelId: hotelId))
        .then((value) {
      value.fold(
        (failure) {
          emit(AddToFavErrorState(error: failure.errorMessage.toString()));
        },
        (message) {
          getFavorites();
          emit(AddToFavSuccessState(message: message));
        },
      );
    });
  }

  void removeFromFav({
    required int hotelId,
  }) {
    emit(RemoveFromFavLoadingState());

    removeFromFavUseCase(FavParams(uId: Helper.uId!, hotelId: hotelId))
        .then((value) {
      value.fold(
        (failure) {
          emit(RemoveFromFavErrorState(error: failure.errorMessage.toString()));
        },
        (message) {
          getFavorites();
          emit(RemoveFromFavSuccessState(message: message));
        },
      );
    });
  }
}
