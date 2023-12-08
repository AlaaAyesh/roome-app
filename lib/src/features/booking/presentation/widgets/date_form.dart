import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/router/routes.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
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
            SizedBox(height: 16.h),
            const Row(
              children: <Widget>[
                Expanded(child: SectionTitle(title: 'Room Type')),
                Spacer(),
                Expanded(child: SectionTitle(title: 'Rooms')),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomBorderedContainer(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            cubit.selectedRoomType,
                            style: AppTextStyles.textStyle14Medium.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor.withOpacity(0.94),
                            ),
                          ),
                        ),
                        Expanded(
                          child: DropdownButton(
                            isExpanded: true,
                            padding: EdgeInsets.zero,
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
                            elevation: 4,
                            underline: Container(height: 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
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
            SizedBox(height: 16.h),
            const Align(
              alignment: AlignmentDirectional.center,
              child: SectionTitle(title: 'Guest'),
            ),
            SizedBox(height: 16.h),
            NumberOfContainer(
              width: 150.w,
              number: cubit.guestNumber,
              reduceOnTap: cubit.guestNumber == 1
                  ? null
                  : () => cubit.decreaseGuestNumber(),
              increaseOnTap: () => cubit.increaseGuestNumber(),
            ),
            SizedBox(height: 50.h),
            Row(
              children: <Widget>[
                Text(
                  'Total: ${computePrice(bookedHotelInfo.price!)}/night',
                  style: AppTextStyles.textStyle14Medium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: GlowingCustomButton(
                    onPressed: () => _continueToBookingTwo(
                      context: context,
                      cubit: cubit,
                    ),
                    buttonText: 'Continue',
                  ),
                ),
              ],
            ),
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
        state: CustomSnackBarState.error,
      );
    }
  }
}
