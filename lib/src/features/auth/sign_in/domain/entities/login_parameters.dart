import 'package:equatable/equatable.dart';

class LoginParameters extends Equatable {
  final String usernameOrEmail;
  final String password;

  const LoginParameters({
    required this.usernameOrEmail,
    required this.password,
  });

  @override
  List<Object?> get props => [usernameOrEmail, password];
}
