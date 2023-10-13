import 'package:equatable/equatable.dart';

class UserParams extends Equatable {
  final int? id;

  const UserParams({this.id});

  @override
  List<Object?> get props => [id];
}
