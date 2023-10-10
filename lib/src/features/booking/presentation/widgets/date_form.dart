import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/core/utils/app_navigator.dart';

import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/custom_snack_bar.dart';
import 'package:roome/src/core/widgets/glowing_custom_button.dart';
import 'package:roome/src/features/booking/presentation/cubit/booking_one/booking_one_cubit.dart';
import 'package:roome/src/features/booking/presentation/widgets/check_container.dart';

import 'package:roome/src/features/booking/presentation/widgets/custom_drop_down_button.dart';
import 'package:roome/src/features/booking/presentation/widgets/number_of.dart';

import 'section_title.dart';

class DateForm extends StatelessWidget {
  const DateForm({
    super.key,
    required this.checkInDate,
    required this.checkOutDate,
    required this.price,
  });

  final double price;
  final String checkInDate;
  final String checkOutDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            const SectionTitle(title: 'Check In'),
            SizedBox(width: SizeConfig.screenWidth! * 0.33),
            const SectionTitle(title: 'Check Out'),
          ],
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.016),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CheckContainer(hint: checkInDate),
            const Icon(Icons.arrow_forward),
            CheckContainer(hint: checkOutDate),
          ],
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.029),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SectionTitle(title: 'Room Type'),
            SectionTitle(title: 'Number of rooms'),
          ],
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.022),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const CustomDropDownButton(),
            BlocBuilder<BookingOneCubit, BookingOneState>(
              builder: (BuildContext context, BookingOneState state) {
                BookingOneCubit cubit =
                    BlocProvider.of<BookingOneCubit>(context);
                return NumberOfContainer(
                  number: cubit.roomNumber,
                  reduceOnTap: cubit.roomNumber == 1
                      ? null
                      : () => cubit.decreaseRoomNumber(),
                  increaseOnTap: () => cubit.increaseRoomNumber(),
                );
              },
            ),
          ],
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.022),
        const Align(
          alignment: Alignment.center,
          child: SectionTitle(title: 'Guest'),
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.019),
        BlocBuilder<BookingOneCubit, BookingOneState>(
          builder: (BuildContext context, BookingOneState state) {
            BookingOneCubit cubit = BlocProvider.of<BookingOneCubit>(context);
            return NumberOfContainer(
              number: cubit.guestNumber,
              reduceOnTap: cubit.guestNumber == 1
                  ? null
                  : () => cubit.decreaseGuestNumber(),
              increaseOnTap: () => cubit.increaseGuestNumber(),
            );
          },
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.056),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BlocBuilder<BookingOneCubit, BookingOneState>(
              builder: (context, state) {
                BookingOneCubit cubit =
                    BlocProvider.of<BookingOneCubit>(context);

                double computePrice(double price) {
                  return price * cubit.roomNumber * cubit.guestNumber;
                }

                return Text(
                  'Total: ${computePrice(price)}/night',
                  style: AppTextStyles.textStyle14Medium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            GlowingCustomButton(
              onPressed: () => continueToBookingTwo(context),
              buttonText: 'Continue',
            ),
          ],
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.014),
      ],
    );
  }

  void continueToBookingTwo(BuildContext context) {
    if (checkInDate != '' && checkOutDate != '') {
      context.navigateTo(routeName: Routes.bookingTwoViewRoute);
    } else {
      CustomSnackBar.show(
        context: context,
        message: "Check In or Check Out can't be blank!",
        title: 'Warning',
      );
    }
  }
}
