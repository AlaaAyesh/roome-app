import 'package:equatable/equatable.dart';
import 'package:roome/src/core/models/hotel.dart';

class Reservation extends Equatable {
  final int? id;
  final Hotel? hotel;
  final int? roomNumber;
  final DateTime? checkInDate;
  final DateTime? checkOutDate;

  const Reservation({
    this.id,
    this.hotel,
    this.roomNumber,
    this.checkInDate,
    this.checkOutDate,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        id: json["id"] as int?,
        hotel: json['hotel'] == null
            ? null
            : Hotel.fromJson(json["hotel"] as Map<String, dynamic>),
        roomNumber: json["roomNumber"] as int?,
        checkInDate: DateTime.parse(json["checkInDate"]),
        checkOutDate: DateTime.parse(json["checkOutDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hotel": hotel?.toJson(),
        "roomNumber": roomNumber,
        "checkInDate": checkInDate?.toIso8601String(),
        "checkOutDate": checkOutDate?.toIso8601String(),
      };

  @override
  List<Object?> get props => [id, hotel, roomNumber, checkInDate, checkOutDate];
}
