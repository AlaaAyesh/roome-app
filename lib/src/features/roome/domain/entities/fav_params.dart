import 'package:equatable/equatable.dart';

class FavParams extends Equatable {
  final int uId;
  final int hotelId;

  const FavParams({required this.uId, required this.hotelId});

  @override
  List<Object?> get props => [uId, hotelId];
}
