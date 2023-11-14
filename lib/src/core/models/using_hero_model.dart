import 'package:equatable/equatable.dart';
import 'package:roome/src/core/models/hotel.dart';

class UsingHeroModel extends Equatable {
  final Hotel hotel;
  final bool usingHero;

  const UsingHeroModel({required this.hotel, this.usingHero = false});

  @override
  List<Object?> get props => [hotel, usingHero];
}
