import 'package:equatable/equatable.dart';

import 'hotel.dart';

class Favorite extends Equatable {
  final int? id;
  final Hotel? hotel;

  const Favorite({
    this.id,
    this.hotel,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json["id"] as int?,
        hotel: json['hotel'] == null
            ? null
            : Hotel.fromJson(json["hotel"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hotel": hotel?.toJson(),
      };

  @override
  List<Object?> get props => [id, hotel];
}
