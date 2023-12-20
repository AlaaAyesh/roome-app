part of 'near_me_cubit.dart';

abstract class NearMeState extends Equatable {
  const NearMeState();

  @override
  List<Object> get props => [];
}

class NearMeInitial extends NearMeState {
  const NearMeInitial();
}

class GetNearMeHotelsLoadingState extends NearMeState {
  const GetNearMeHotelsLoadingState();
}

class GetNearMeHotelsSuccessState extends NearMeState {
  final List<Hotel> nearMeHotels;

  const GetNearMeHotelsSuccessState({required this.nearMeHotels});

  @override
  List<Object> get props => [nearMeHotels];
}

class GetNearMeHotelsErrorState extends NearMeState {
  final String error;

  const GetNearMeHotelsErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
