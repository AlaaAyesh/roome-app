import 'package:flutter/material.dart';
import 'package:roome/src/features/booking/presentation/widgets/booking_one_view_body.dart';

class BookingOneView extends StatelessWidget {
  const BookingOneView({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookingOneViewBody(price: price)),
    );
  }
}
