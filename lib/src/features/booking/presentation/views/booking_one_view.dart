import 'package:flutter/material.dart';
import 'package:roome/src/features/booking/data/models/booked_hotel_info.dart';
import 'package:roome/src/features/booking/presentation/widgets/booking_one_view_body.dart';

class BookingOneView extends StatelessWidget {
  const BookingOneView({super.key, required this.bookedHotelInfo});

  final BookedHotelInfo bookedHotelInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookingOneViewBody(bookedHotelInfo: bookedHotelInfo),
    );
  }
}
