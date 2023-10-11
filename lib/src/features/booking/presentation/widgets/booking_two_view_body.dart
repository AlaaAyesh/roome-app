import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/features/booking/presentation/widgets/booking_app_bar.dart';

import 'booking_one_form_numbers.dart';
import 'booking_two_form.dart';

class BookingTwoViewBody extends StatelessWidget {
  const BookingTwoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            const BookingAppBar(),
            SizedBox(height: SizeConfig.screenHeight! * 0.02),
            const BookingOneFormNumbers(isBookingOne: false),
            SizedBox(height: SizeConfig.screenHeight! * 0.046),
            const BookingTwoForm(),
          ],
        ),
      ),
    );
  }
}
