import 'package:flutter/material.dart';
import 'package:roome/src/features/booking/data/models/booking_info.dart';
import 'package:roome/src/features/booking/presentation/widgets/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  final BookingInfo bookingInfo;

  const PaymentView({super.key, required this.bookingInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: PaymentViewBody(bookingInfo: bookingInfo)),
    );
  }
}
