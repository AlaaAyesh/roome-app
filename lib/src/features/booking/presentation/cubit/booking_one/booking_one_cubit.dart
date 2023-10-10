import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'booking_one_state.dart';

class BookingOneCubit extends Cubit<BookingOneState> {
  BookingOneCubit() : super(BookingOneInitial());

  int roomNumber = 1;

  void increaseRoomNumber() {
    roomNumber++;
    emit(IncreaseRoomNumberState(number: roomNumber));
  }

  void decreaseRoomNumber() {
    roomNumber--;
    emit(DecreaseRoomNumberState(number: roomNumber));
  }

  int guestNumber = 1;

  void increaseGuestNumber() {
    guestNumber++;
    emit(IncreaseGuestNumberState(number: guestNumber));
  }

  void decreaseGuestNumber() {
    guestNumber--;
    emit(DecreaseGuestNumberState(number: guestNumber));
  }
}
