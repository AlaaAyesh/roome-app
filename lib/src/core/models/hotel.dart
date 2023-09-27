import 'package:equatable/equatable.dart';

import 'facility.dart';

class Hotel extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? location;
  final double? rate;
  final double? price;
  final String? admin;
  final int? numberRooms;
  final List<Facility>? facilities;

  const Hotel({
    this.id,
    this.name,
    this.description,
    this.location,
    this.rate,
    this.price,
    this.admin,
    this.numberRooms,
    this.facilities,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        id: json["id"] as int?,
        name: json["name"] as String?,
        description: json["description"] as String?,
        location: json["location"] as String?,
        rate: json["rate"] as double?,
        price: json["price"] as double?,
        admin: json["admin"] as String?,
        numberRooms: json["numberRooms"] as int?,
        facilities: json['facilities'] == null
            ? null
            : List<Facility>.from(json["facilities"]
                .map((x) => Facility.fromJson(x) as Map<String, dynamic>)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "location": location,
        "rate": rate,
        "price": price,
        "admin": admin,
        "numberRooms": numberRooms,
        "facilities": List<dynamic>.from(facilities!.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        location,
        rate,
        price,
        admin,
        numberRooms,
        facilities
      ];
}
