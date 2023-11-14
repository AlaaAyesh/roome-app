import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/models/hotel.dart';
import 'package:roome/src/features/home/domain/usecases/near_me/get_near_me_hotels_usecase.dart';

part 'near_me_state.dart';

class NearMeCubit extends Cubit<NearMeState> {
  final GetNearMeHotelsUseCase getNearMeHotelsUseCase;

  NearMeCubit({
    required this.getNearMeHotelsUseCase,
  }) : super(NearMeInitial());

  List<Hotel> resultNearMe = <Hotel>[];

  void getNearMeHotels() {
    emit(GetNearMeHotelsLoadingState());

    getNearMeHotelsUseCase(Helper.uId).then((value) {
      value.fold(
        (failure) {
          emit(GetNearMeHotelsErrorState(
              error: failure.errorMessage.toString()));
        },
        (nearMeHotels) {
          resultNearMe = nearMeHotels;
          emit(GetNearMeHotelsSuccessState(nearMeHotels: nearMeHotels));
        },
      );
    });
  }
}
