part of 'recommended_cubit.dart';

abstract class RecommendedState extends Equatable {
  const RecommendedState();

  @override
  List<Object> get props => [];
}

class RecommendedInitial extends RecommendedState {
  const RecommendedInitial();
}

class GetRecommendedHotelsLoadingState extends RecommendedState {
  const GetRecommendedHotelsLoadingState();
}

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
