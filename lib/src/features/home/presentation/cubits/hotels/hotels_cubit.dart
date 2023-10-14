import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/no_params.dart';
import '../../../../../core/models/hotel.dart';
import '../../../domain/usecases/hotels/get_hotels_usecase.dart';

part 'hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  final GetHotelsUseCase getHotelsUseCase;

  HotelsCubit({required this.getHotelsUseCase}) : super(HotelsInitial());

  List<Hotel> resultHotels = <Hotel>[];

  Future<void> getHotels() async {
    emit(GetHotelsLoadingState());

    await getHotelsUseCase(const NoParams()).then((value) {
      value.fold(
        (failure) {
          emit(GetHotelsErrorState(error: failure.errorMessage.toString()));
        },
        (hotels) {
          resultHotels = hotels;
          emit(GetHotelsSuccessState(hotels: hotels));
        },
      );
    });
  }
}
