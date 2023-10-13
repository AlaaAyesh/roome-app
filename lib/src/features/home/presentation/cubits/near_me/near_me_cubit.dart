import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/helpers/helper.dart';
import '../../../../../core/models/hotel.dart';
import '../../../../favorite/domain/entities/user_params.dart';
import '../../../../home/domain/usecases/near_me/get_near_me_hotels_usecase.dart';

part 'near_me_state.dart';

class NearMeCubit extends Cubit<NearMeState> {
  final GetNearMeHotelsUseCase getNearMeHotelsUseCase;

  NearMeCubit({
    required this.getNearMeHotelsUseCase,
  }) : super(NearMeInitial());

  List<Hotel> resultNearMe = <Hotel>[];

  void getNearMeHotels() {
    emit(GetNearMeHotelsLoadingState());

    getNearMeHotelsUseCase(UserParams(id: Helper.uId)).then((value) {
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
