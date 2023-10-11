import 'package:flutter/material.dart';
import 'package:roome/src/features/booking/data/models/booking_info.dart';
import 'package:roome/src/features/booking/presentation/widgets/ticket_view_body.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key, required this.bookingInfo});

  final BookingInfo bookingInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: TicketViewBody(bookingInfo: bookingInfo)),
    );
  }
}
