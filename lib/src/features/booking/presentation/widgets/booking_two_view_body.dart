import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/features/booking/data/models/booking_info.dart';
import 'package:roome/src/features/booking/presentation/widgets/booking_app_bar.dart';

import 'booking_one_form_numbers.dart';
import 'booking_two_form.dart';

class BookingTwoViewBody extends StatelessWidget {
  final BookingInfo bookingInfo;

  const BookingTwoViewBody({super.key, required this.bookingInfo});

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
              child: const BookingOneFormNumbers(isBookingOne: false),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.046),
            BookingTwoForm(bookingInfo: bookingInfo),
          ],
        ),
      ),
    );
  }
}
