import 'package:equatable/equatable.dart';

class Role extends Equatable {
  final int? id;
  final String? name;

  const Role({
    this.id,
    this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"] as int?,
        name: json["name"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  List<Object?> get props => [id, name];
}
