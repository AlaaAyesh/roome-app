part of 'booking_one_cubit.dart';

abstract class BookingOneState extends Equatable {
  const BookingOneState();

  @override
  List<Object> get props => [];
}

class BookingOneInitial extends BookingOneState {
  const BookingOneInitial();
}

class IncreaseRoomNumberState extends BookingOneState {
  final int number;

  const IncreaseRoomNumberState({required this.number});

  @override
  List<Object> get props => [number];
}

class DecreaseRoomNumberState extends BookingOneState {
  final int number;

  const DecreaseRoomNumberState({required this.number});

  @override
  List<Object> get props => [number];
}

class IncreaseGuestNumberState extends BookingOneState {
  final int number;

  const IncreaseGuestNumberState({required this.number});

  @override
  List<Object> get props => [number];
}

class DecreaseGuestNumberState extends BookingOneState {
  final int number;

  const DecreaseGuestNumberState({required this.number});

  @override
  List<Object> get props => [number];
}

class ChangeSelectedRoomType extends BookingOneState {
  final String selectedRoomType;

  const ChangeSelectedRoomType({required this.selectedRoomType});

  @override
  List<Object> get props => [selectedRoomType];
}
