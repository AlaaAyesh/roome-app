part of '../../../../home/presentation/cubits/hotels/hotels_cubit.dart';

sealed class HotelsState extends Equatable {
  const HotelsState();

  @override
  List<Object> get props => [];
}

final class HotelsInitial extends HotelsState {}

class GetHotelsLoadingState extends HotelsState {}

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
