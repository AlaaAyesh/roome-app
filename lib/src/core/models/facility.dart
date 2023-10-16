import 'package:equatable/equatable.dart';

class Facility extends Equatable {
  final int? id;
  final String? name;
  final String? icon;

  const Facility({
    this.id,
    this.name,
    this.icon,
  });

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        id: json["id"] as int?,
        name: json["name"] as String?,
        icon: json["icon"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
      };

  @override
  List<Object?> get props => [id, name, icon];
}
