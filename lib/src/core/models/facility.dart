import 'package:equatable/equatable.dart';

import 'role.dart';

class Facility extends Equatable {
  final int? id;
  final Role? facility;

  const Facility({
    this.id,
    this.facility,
  });

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        id: json["id"] as int?,
        facility: json['facility'] == null
            ? null
            : Role.fromJson(json["facility"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facility": facility?.toJson(),
      };

  @override
  List<Object?> get props => [id, facility];
}
