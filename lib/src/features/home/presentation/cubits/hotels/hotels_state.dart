part of 'hotels_cubit.dart';

abstract class HotelsState extends Equatable {
  const HotelsState();

  @override
  List<Object> get props => [];
}

class HotelsInitial extends HotelsState {
  const HotelsInitial();
}

class GetHotelsLoadingState extends HotelsState {
  const GetHotelsLoadingState();
}

class GetHotelsSuccessState extends HotelsState {
  final List<Hotel> hotels;

  const GetHotelsSuccessState({required this.hotels});

  @override
  List<Object> get props => [hotels];
}

class GetHotelsErrorState extends HotelsState {
  final String error;

  const GetHotelsErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
