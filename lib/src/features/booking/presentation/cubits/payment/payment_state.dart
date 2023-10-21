part of 'payment_cubit.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

final class PaymentInitial extends PaymentState {}

class ContinueTappedState extends PaymentState {
  final bool isContinueTapped;

  const ContinueTappedState({required this.isContinueTapped});

  @override
  List<Object> get props => [isContinueTapped];
}
