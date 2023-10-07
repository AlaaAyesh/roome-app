part of 'recommended_cubit.dart';

sealed class RecommendedState extends Equatable {
  const RecommendedState();

  @override
  List<Object> get props => [];
}

final class RecommendedInitial extends RecommendedState {}

class GetRecommendedHotelsLoadingState extends RecommendedState {}

class GetRecommendedHotelsSuccessState extends RecommendedState {
  final List<Hotel> recommendedHotels;

  const GetRecommendedHotelsSuccessState({required this.recommendedHotels});

  @override
  List<Object> get props => [recommendedHotels];
}

class GetRecommendedHotelsErrorState extends RecommendedState {
  final String error;

  const GetRecommendedHotelsErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
