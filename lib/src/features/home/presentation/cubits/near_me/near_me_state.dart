part of 'near_me_cubit.dart';

sealed class NearMeState extends Equatable {
  const NearMeState();

  @override
  List<Object> get props => [];
}

final class NearMeInitial extends NearMeState {}

class GetNearMeHotelsLoadingState extends NearMeState {}

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
