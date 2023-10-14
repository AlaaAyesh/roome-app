import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/features/booking/data/models/booked_hotel_info.dart';

import 'package:roome/src/features/booking/presentation/widgets/booking_one_form_numbers.dart';

import 'booking_app_bar.dart';
import 'booking_one_body_content.dart';

import 'section_title.dart';

class BookingOneViewBody extends StatelessWidget {
  const BookingOneViewBody({super.key, required this.bookedHotelInfo});

  final BookedHotelInfo bookedHotelInfo;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(
          top: 42.h,
          left: 31.w,
          right: 31.w,
          bottom: 14.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeInRight(
              from: AppConstants.fadeInHorizontalValue,
              child: const BookingAppBar(),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.02),
            FadeInRight(
              from: AppConstants.fadeInHorizontalValue,
              child: const BookingOneFormNumbers(isBookingOne: true),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.023),
            FadeInLeft(
              from: AppConstants.fadeInHorizontalValue,
              child: const SectionTitle(title: 'Select Date'),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.012),
            BookingOneBodyContent(bookedHotelInfo: bookedHotelInfo),
          ],
        ),
      ),
    );
  }
}
