import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? email;
  final String? uId;
  final String? password;
  final String? image;

  const UserEntity({
    this.name,
    this.email,
    this.uId,
    this.image,
    this.password,
  });

  @override
  List<Object?> get props => [name, email, uId, password, image];
}
