import 'package:equatable/equatable.dart';
import 'package:roome/src/core/models/hotel.dart';
import 'package:roome/src/core/models/reservation.dart';
import 'package:roome/src/core/models/role.dart';

class UserModel extends Equatable {
  final int? id;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? username;
  final String? email;
  final String? password;
  final Role? role;
  final String? profileImage;
  final String? phoneNumber;
  final String? occupation;
  final String? nationality;
  final List<Reservation>? reservations;
  final List<Hotel>? favorites;

  const UserModel({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.username,
    this.email,
    this.password,
    this.role,
    this.profileImage,
    this.reservations,
    this.favorites,
    this.phoneNumber,
    this.occupation,
    this.nationality,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] as int?,
        firstName: json["firstName"] as String?,
        middleName: json["middleName"] as String?,
        lastName: json["lastName"] as String?,
        username: json["username"] as String?,
        email: json["email"] as String?,
        password: json["password"] as String?,
        role: json['role'] == null
            ? null
            : Role.fromJson(json["role"] as Map<String, dynamic>),
        profileImage: json["profileImage"] as String?,
        reservations: json['reservations'] == null
            ? null
            : List<Reservation>.from(json["reservations"].map(
                (x) => Reservation.fromJson(x as Map<String, dynamic>),
              )),
        favorites: json['favorites'] == null
            ? null
            : List<Hotel>.from(
                json["favorites"]
                    .map((x) => Hotel.fromJson(x as Map<String, dynamic>)),
              ),
        phoneNumber: json["phoneNumber"] as String?,
        occupation: json["occupation"] as String?,
        nationality: json["nationality"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "username": username,
        "email": email,
        "password": password,
        "role": role?.toJson(),
        "profileImage": profileImage,
        "reservations":
            List<dynamic>.from(reservations!.map((x) => x.toJson())),
        "favorites": List<dynamic>.from(favorites!.map((x) => x.toJson())),
        "nationality": nationality,
        "occupation": occupation,
        "phoneNumber": phoneNumber,
      };

  @override
  List<Object?> get props => [
        id,
        firstName,
        middleName,
        lastName,
        username,
        email,
        password,
        role,
        reservations,
        profileImage,
        favorites,
        occupation,
        phoneNumber,
        nationality,
      ];
}
