import 'package:equatable/equatable.dart';

class BookingInfo extends Equatable {
  final String? hotelName;
  final String? checkInDate;
  final String? checkOutDate;
  final String? roomType;
  final int? guestNumber;
  final int? roomNumber;

  const BookingInfo({
    this.hotelName,
    this.checkInDate,
    this.checkOutDate,
    this.roomType,
    this.guestNumber,
    this.roomNumber,
  });

  @override
  List<Object?> get props => [
        hotelName,
        checkInDate,
        checkOutDate,
        roomNumber,
        roomType,
        guestNumber,
      ];
}
