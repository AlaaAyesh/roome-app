part of 'payment_cubit.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {
  const PaymentInitial();
}

class ContinueTappedState extends PaymentState {
  final bool isContinueTapped;

  const ContinueTappedState({required this.isContinueTapped});

  @override
  List<Object> get props => [isContinueTapped];
}

class ChangePaypalCircleColorState extends PaymentState {
  final Color circleColor;

  const ChangePaypalCircleColorState({required this.circleColor});

  @override
  List<Object> get props => [circleColor];
}

class ChangeCreditCircleColorState extends PaymentState {
  final Color circleColor;

  const ChangeCreditCircleColorState({required this.circleColor});

  @override
  List<Object> get props => [circleColor];
}
