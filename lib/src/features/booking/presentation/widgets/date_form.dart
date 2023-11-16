import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/core/widgets/custom_snack_bar.dart';
import 'package:roome/src/core/widgets/glowing_custom_button.dart';
import 'package:roome/src/features/booking/data/models/booked_hotel_info.dart';
import 'package:roome/src/features/booking/data/models/booking_info.dart';
import 'package:roome/src/features/booking/presentation/cubits/booking_one/booking_one_cubit.dart';
import 'package:roome/src/features/booking/presentation/widgets/check_in_and_out.dart';
import 'package:roome/src/features/booking/presentation/widgets/custom_bordered_container.dart';
import 'package:roome/src/features/booking/presentation/widgets/number_of.dart';
import 'package:roome/src/features/booking/presentation/widgets/section_title.dart';

class DateForm extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return BlocBuilder<BookingOneCubit, BookingOneState>(
      builder: (context, state) {
        final List<String> roomTypes = <String>['Double', 'Single'];

        BookingOneCubit cubit = BlocProvider.of<BookingOneCubit>(context);

        double computePrice(double price) {
          return price * cubit.roomNumber * cubit.guestNumber;
        }

        return Column(
          children: <Widget>[
            CheckInAndOut(
              checkInDate: checkInDate,
              checkOutDate: checkOutDate,
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SectionTitle(title: 'Room Type'),
                SectionTitle(title: 'Number of rooms'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomBorderedContainer(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: <Widget>[
                        Text(
                          cubit.selectedRoomType,
                          style: AppTextStyles.textStyle14Medium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor.withOpacity(0.94),
                          ),
                        ),
                        Expanded(
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            items: roomTypes
                                .map<DropdownMenuItem<String>>((String type) {
                              return DropdownMenuItem<String>(
                                value: type,
                                child: Text(
                                  type,
                                  style:
                                      AppTextStyles.textStyle14Medium.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor
                                        .withOpacity(0.94),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newVal) {
                              cubit.changeSelectedRoomType(newVal);
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
                            elevation: 4.toInt(),
                            underline: Container(height: 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                BlocBuilder<BookingOneCubit, BookingOneState>(
                  builder: (BuildContext context, BookingOneState state) {
                    BookingOneCubit cubit =
                        BlocProvider.of<BookingOneCubit>(context);
                    return Expanded(
                      child: NumberOfContainer(
                        number: cubit.roomNumber,
                        reduceOnTap: cubit.roomNumber == 1
                            ? null
                            : () => cubit.decreaseRoomNumber(),
                        increaseOnTap: () => cubit.increaseRoomNumber(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 22),
            const Align(
              alignment: AlignmentDirectional.center,
              child: SectionTitle(title: 'Guest'),
            ),
            const SizedBox(height: 16),
            NumberOfContainer(
              number: cubit.guestNumber,
              reduceOnTap: cubit.guestNumber == 1
                  ? null
                  : () => cubit.decreaseGuestNumber(),
              increaseOnTap: () => cubit.increaseGuestNumber(),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total: ${computePrice(bookedHotelInfo.price!)}/night',
                  style: AppTextStyles.textStyle14Medium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GlowingCustomButton(
                  onPressed: () => _continueToBookingTwo(
                    context: context,
                    cubit: cubit,
                  ),
                  buttonText: 'Continue',
                ),
              ],
            ),
            const BottomSpacer(),
          ],
        );
      },
    );
  }

  void _continueToBookingTwo({
    required BuildContext context,
    required BookingOneCubit cubit,
  }) {
    if (checkInDate != '' && checkOutDate != '') {
      context.navigateTo(
        routeName: Routes.bookingTwoViewRoute,
        arguments: BookingInfo(
          hotelName: bookedHotelInfo.hotelName,
          checkInDate: checkInDate,
          checkOutDate: checkOutDate,
          roomNumber: cubit.roomNumber,
          guestNumber: cubit.guestNumber,
          roomType: cubit.selectedRoomType,
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
