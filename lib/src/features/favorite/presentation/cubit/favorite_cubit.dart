import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../../../../core/helpers/helper.dart';
import '../../../../core/models/hotel.dart';
import '../../domain/entities/user_params.dart';
import '../../domain/entities/fav_params.dart';
import '../../domain/usecases/add_to_fav_usecase.dart';
import '../../domain/usecases/get_favorites_usecase.dart';
import '../../domain/usecases/remove_from_fav_usecase.dart';

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

    getFavoritesUseCase(UserParams(id: Helper.uId)).then((value) {
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
