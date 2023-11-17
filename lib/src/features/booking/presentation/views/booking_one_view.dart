import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/custom_sliver_app_bar.dart';
import 'package:roome/src/features/booking/data/models/booked_hotel_info.dart';
import 'package:roome/src/features/booking/presentation/widgets/booking_one_body_content.dart';
import 'package:roome/src/features/booking/presentation/widgets/booking_one_form_numbers.dart';
import 'package:roome/src/features/booking/presentation/widgets/section_title.dart';

class BookingOneView extends StatelessWidget {
  const BookingOneView({super.key, required this.bookedHotelInfo});

  final BookedHotelInfo bookedHotelInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: AppConstants.physics,
          slivers: [
            const CustomSliverAppBar(
              titleText: 'Booking Form',
              centerTitle: true,
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: 31,
                right: 31,
                bottom: 14,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInRight(
                      from: AppConstants.fadeInHorizontalValue,
                      child: const BookingOneFormNumbers(isBookingOne: true),
                    ),
                    const SizedBox(height: 23),
                    FadeInLeft(
                      from: AppConstants.fadeInHorizontalValue,
                      child: const SectionTitle(title: 'Select Date'),
                    ),
                    const SizedBox(height: 12),
                    BookingOneBodyContent(bookedHotelInfo: bookedHotelInfo),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
