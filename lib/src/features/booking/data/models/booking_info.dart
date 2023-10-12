import 'package:equatable/equatable.dart';

class BookingInfo extends Equatable {
  final String? firstName;
  final String? surname;
  final String? phoneNumber;
  final String? email;
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
    this.firstName,
    this.surname,
    this.phoneNumber,
    this.email,
  });

  Map<String, dynamic> toJson() => {
        'hotelName': hotelName,
        'checkInData': checkInDate,
        'checkOutDate': checkOutDate,
        'roomType': roomType,
        'roomNumber': roomNumber,
        'guestNumber': guestNumber,
        'firstName': firstName,
        'surname': surname,
        'phoneNumber': phoneNumber,
        'email': email,
      };

  @override
  List<Object?> get props => [
        hotelName,
        checkInDate,
        checkOutDate,
        roomNumber,
        roomType,
        guestNumber,
        firstName,
        surname,
        phoneNumber,
        email,
      ];
}
