import 'package:equatable/equatable.dart';

class SignUpParameters extends Equatable {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;

  const SignUpParameters({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [firstName, lastName, username, email, password];
}
