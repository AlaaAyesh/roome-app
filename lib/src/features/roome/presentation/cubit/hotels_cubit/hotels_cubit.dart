import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/entities/no_params.dart';
import '../../../../../core/models/hotel.dart';
import '../../../domain/usecases/hotels/get_hotels_usecase.dart';

part 'hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  final GetHotelsUseCase getHotelsUseCase;

  HotelsCubit({required this.getHotelsUseCase}) : super(HotelsInitial());

  Future<void> getHotels() async {
    emit(GetHotelsLoadingState());

    await getHotelsUseCase(const NoParams()).then((value) {
      value.fold(
        (failure) {
          emit(GetHotelsErrorState(error: failure.errorMessage.toString()));
        },
        (hotels) {
          emit(GetHotelsSuccessState(hotels: hotels));
        },
      );
    });
  }
}
