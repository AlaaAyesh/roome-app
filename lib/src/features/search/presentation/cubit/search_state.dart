part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<Hotel> hotels;
  const SearchSuccessState({required this.hotels});

  @override
  List<Object> get props => [hotels];
}

class SearchErrorState extends SearchState {
  final String errorMessage;
  const SearchErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
