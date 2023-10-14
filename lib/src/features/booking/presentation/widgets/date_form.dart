import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_navigator.dart';

import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/custom_snack_bar.dart';
import 'package:roome/src/core/widgets/glowing_custom_button.dart';
import 'package:roome/src/features/booking/data/models/booked_hotel_info.dart';
import 'package:roome/src/features/booking/data/models/booking_info.dart';
import 'package:roome/src/features/booking/presentation/cubit/booking_one/booking_one_cubit.dart';

import 'package:roome/src/features/booking/presentation/widgets/check_in_and_out.dart';

import 'package:roome/src/features/booking/presentation/widgets/number_of.dart';

import '../../../../core/utils/app_colors.dart';
import 'custom_bordered_container.dart';
import 'section_title.dart';

class DateForm extends StatefulWidget {
  const DateForm({
    super.key,
    required this.checkInDate,
    required this.checkOutDate,
    required this.bookedHotelInfo,
  });

  final BookedHotelInfo bookedHotelInfo;
  final String checkInDate;
  final String checkOutDate;

  @override
  State<DateForm> createState() => _DateFormState();
}

class _DateFormState extends State<DateForm> {
  String _selectedRoomType = 'Double';

  final List<String> _roomTypes = <String>['Double', 'Single'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CheckInAndOut(
          checkInDate: widget.checkInDate,
          checkOutDate: widget.checkOutDate,
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
            CustomBorderedContainer(
              padding: EdgeInsets.only(left: 8.w),
              child: Row(
                children: <Widget>[
                  Text(
                    _selectedRoomType,
                    style: AppTextStyles.textStyle14Medium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor.withOpacity(0.94),
                    ),
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(10.r),
                    items:
                        _roomTypes.map<DropdownMenuItem<String>>((String type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(
                          type,
                          style: AppTextStyles.textStyle14Medium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor.withOpacity(0.94),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        _selectedRoomType = newVal!;
                      });
                    },
                    icon: BlocBuilder<ThemesCubit, ThemeData>(
                      builder: (context, state) {
                        return Icon(
                          Icons.keyboard_arrow_down,
                          color: state.brightness == Brightness.light
                              ? Colors.black.withOpacity(0.62)
                              : Colors.white70,
                        );
                      },
                    ),
                    elevation: 4.w.toInt(),
                    underline: Container(height: 0),
                  ),
                ],
              ),
            ),
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
                  'Total: ${computePrice(widget.bookedHotelInfo.price!)}/night',
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
    if (widget.checkInDate != '' && widget.checkOutDate != '') {
      context.navigateTo(
        routeName: Routes.bookingTwoViewRoute,
        arguments: BookingInfo(
          hotelName: widget.bookedHotelInfo.hotelName,
          checkInDate: widget.checkInDate,
          checkOutDate: widget.checkOutDate,
          roomNumber: BlocProvider.of<BookingOneCubit>(context).roomNumber,
          guestNumber: BlocProvider.of<BookingOneCubit>(context).guestNumber,
          roomType: _selectedRoomType,
        ),
      );
    } else {
      CustomSnackBar.show(
        context: context,
        message: "Check In or Check Out can't be blank!",
        title: 'Warning',
      );
    }
  }
}
