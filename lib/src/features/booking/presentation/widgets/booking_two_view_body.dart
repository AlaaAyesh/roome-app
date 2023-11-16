import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/custom_sliver_app_bar.dart';
import 'package:roome/src/features/booking/data/models/booking_info.dart';
import 'package:roome/src/features/booking/presentation/widgets/booking_one_form_numbers.dart';
import 'package:roome/src/features/booking/presentation/widgets/booking_two_form.dart';

class BookingTwoViewBody extends StatelessWidget {
  final BookingInfo bookingInfo;

  const BookingTwoViewBody({super.key, required this.bookingInfo});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: AppConstants.physics,
      slivers: [
        const CustomSliverAppBar(title: 'Booking Form', centerTitle: true),
        SliverPadding(
          padding: const EdgeInsets.only(left: 31, right: 31),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeInRight(
                  from: AppConstants.fadeInHorizontalValue,
                  child: const BookingOneFormNumbers(isBookingOne: false),
                ),
                const SizedBox(height: 46),
                BookingTwoForm(bookingInfo: bookingInfo),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
