import 'package:equatable/equatable.dart';

class SearchHotelParams extends Equatable {
  final String hotelName;

  const SearchHotelParams({
    required this.hotelName,
  });

  @override
  List<Object?> get props => [hotelName];
}
