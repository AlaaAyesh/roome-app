import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/helper.dart';
import '../../../../../core/models/hotel.dart';
import '../../../../favorite/domain/entities/user_params.dart';
import '../../../../home/domain/usecases/recommended/get_recommended_hotels_usecase.dart';

part 'recommended_state.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  final GetRecommendedHotelsUseCase getRecommendedHotelsUseCase;

  RecommendedCubit({required this.getRecommendedHotelsUseCase})
      : super(RecommendedInitial());

  void getRecommendedHotels() {
    emit(GetRecommendedHotelsLoadingState());

    getRecommendedHotelsUseCase(UserParams(id: Helper.uId)).then((value) {
      value.fold(
        (failure) {
          emit(GetRecommendedHotelsErrorState(
              error: failure.errorMessage.toString()));
        },
        (recommendedHotels) {
          emit(GetRecommendedHotelsSuccessState(
              recommendedHotels: recommendedHotels));
        },
      );
    });
  }
}
