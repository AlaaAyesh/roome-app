import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/utils/app_colors.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  bool isContinueTapped = false;

  void convertContinue() {
    isContinueTapped = true;

    emit(ContinueTappedState(isContinueTapped: isContinueTapped));
  }

  Color paypalCircleColor = Colors.white;

  void changePaypalCircleColor() {
    if (paypalCircleColor == Colors.white) {
      paypalCircleColor = AppColors.primaryColor;
    } else {
      paypalCircleColor = Colors.white;
    }

    emit(ChangePaypalCircleColorState(circleColor: paypalCircleColor));
  }

  Color creditCircleColor = Colors.white;

  void changeCreditCircleColor() {
    if (creditCircleColor == Colors.white) {
      creditCircleColor = AppColors.primaryColor;
    } else {
      creditCircleColor = Colors.white;
    }

    emit(ChangePaypalCircleColorState(circleColor: creditCircleColor));
  }
}
