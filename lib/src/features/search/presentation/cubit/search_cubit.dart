import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

import 'package:roome/src/features/search/domain/usecases/search_hotels_usecase.dart';

import '../../../../core/models/hotel.dart';
import '../../domain/entities/search_hotel_params.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchHotelsUseCase searchHotelsUseCase;

  SearchCubit({required this.searchHotelsUseCase}) : super(SearchInitial());

  void searchHotels({required String hotelName}) {
    emit(SearchLoadingState());

    searchHotelsUseCase(SearchHotelParams(hotelName: hotelName)).then((value) {
      value.fold(
        (failure) {
          debugPrint('ERROR: ${failure.errorMessage.toString()}');
          emit(SearchErrorState(errorMessage: failure.errorMessage.toString()));
        },
        (hotels) => emit(SearchSuccessState(hotels: hotels)),
      );
    });
  }
}
