import 'package:equatable/equatable.dart';

class BookedHotelInfo extends Equatable {
  final String? hotelName;
  final double? price;

  const BookedHotelInfo({required this.hotelName, required this.price});

  @override
  List<Object?> get props => [hotelName, price];
}
