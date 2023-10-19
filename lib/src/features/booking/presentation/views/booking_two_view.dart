import 'package:flutter/material.dart';

import '/src/features/booking/data/models/booking_info.dart';
import '/src/features/booking/presentation/widgets/booking_two_view_body.dart';

class BookingTwoView extends StatelessWidget {
  final BookingInfo bookingInfo;
  const BookingTwoView({super.key, required this.bookingInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookingTwoViewBody(bookingInfo: bookingInfo),
      ),
    );
  }
}
