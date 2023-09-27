import 'package:equatable/equatable.dart';

class LoginParameters extends Equatable {
  final String username;
  final String password;

  const LoginParameters({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}
