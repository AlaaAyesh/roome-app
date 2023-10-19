import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../data/models/booking_info.dart';
import '/src/config/themes/cubit/themes_cubit.dart';
import '/src/core/utils/app_colors.dart';
import 'check_in_and_out.dart';
import 'info_row.dart';

class BookingInfoContainer extends StatelessWidget {
  const BookingInfoContainer({
    super.key,
    required this.bookingInfo,
  });

  final BookingInfo bookingInfo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return Container(
          height: SizeConfig.screenHeight! * 0.72,
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
          decoration: BoxDecoration(
            color: state.brightness == Brightness.light
                ? Colors.white
                : AppColors.darkGreyColor,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            border: Border.all(
              color: HexColorHandler('E3E3E4'),
              width: 1.w,
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(0, 1.73.w),
                blurRadius: 10.w,
                color: AppColors.shadowColor,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  bookingInfo.hotelName!,
                  style: AppTextStyles.appBarTextStyle.copyWith(
                    color: state.brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.014),
                SizedBox(
                  height: 150.h,
                  child: PrettyQrView.data(
                    data: jsonEncode(bookingInfo.toJson()),
                    decoration: PrettyQrDecoration(
                      shape: PrettyQrRoundedSymbol(
                        color: state.brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.023),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Booking ID:',
                      style: AppTextStyles.textStyle15.copyWith(
                        fontWeight: FontWeight.w500,
                        color: state.brightness == Brightness.light
                            ? Colors.black.withOpacity(0.46)
                            : AppColors.white60,
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth! * 0.02),
                    Text(
                      _generateRandomString(),
                      style: AppTextStyles.textStyle15.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.03),
                InfoRow(
                  title: 'Name',
                  info: '${bookingInfo.firstName} ${bookingInfo.surname}',
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.015),
                InfoRow(
                  title: 'Email',
                  info: bookingInfo.email!,
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.015),
                InfoRow(
                  title: 'Phone',
                  info: bookingInfo.phoneNumber!,
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.02),
                CheckInAndOut(
                  checkInDate: bookingInfo.checkInDate!,
                  checkOutDate: bookingInfo.checkOutDate!,
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.02),
                InfoRow(
                  title: 'Room Type',
                  info: bookingInfo.roomType!,
                  isRoomType: true,
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.015),
                InfoRow(
                  title: 'Guest',
                  info: bookingInfo.guestNumber!.toString(),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.015),
                InfoRow(
                  title: 'Number of rooms',
                  info: bookingInfo.roomNumber!.toString(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _generateRandomString() {
    var rng = Random();
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIKLMNOPQRSTUVWXYZ0123456789';
    return String.fromCharCodes(Iterable.generate(
        9, (_) => chars.codeUnitAt(rng.nextInt(chars.length))));
  }
}
