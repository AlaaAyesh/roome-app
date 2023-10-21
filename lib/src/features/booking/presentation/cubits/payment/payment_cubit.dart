import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  bool isContinueTapped = false;

  void convertContinue() {
    isContinueTapped = true;

    emit(ContinueTappedState(isContinueTapped: isContinueTapped));
  }
}
