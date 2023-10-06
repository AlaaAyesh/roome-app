import 'package:equatable/equatable.dart';

class FavChangeParams extends Equatable {
  final int uId;
  final int hotelId;

  const FavChangeParams({required this.uId, required this.hotelId});

  @override
  List<Object?> get props => [uId, hotelId];
}
