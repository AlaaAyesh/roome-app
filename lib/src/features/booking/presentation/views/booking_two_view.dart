import 'package:flutter/material.dart';
import 'package:roome/src/features/booking/presentation/widgets/booking_two_view_body.dart';

class BookingTwoView extends StatelessWidget {
  const BookingTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: BookingTwoViewBody(),
      ),
    );
  }
}
