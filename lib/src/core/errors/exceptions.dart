import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String? exception;

  const ServerException({this.exception});

  @override
  List<Object?> get props => [exception];
}
