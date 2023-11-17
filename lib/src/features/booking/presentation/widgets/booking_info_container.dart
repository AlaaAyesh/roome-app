import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/hex_color_handler.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/booking/data/models/booking_info.dart';
import 'package:roome/src/features/booking/presentation/widgets/check_in_and_out.dart';
import 'package:roome/src/features/booking/presentation/widgets/info_row.dart';

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
          constraints: const BoxConstraints(minHeight: 0),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 27),
          decoration: BoxDecoration(
            color: state.brightness == Brightness.light
                ? Colors.white
                : const Color.fromARGB(255, 73, 73, 73),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: HexColorHandler('E3E3E4'),
              width: 1,
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: const Offset(0, 1.73),
                blurRadius: 10,
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
                const SizedBox(height: 14),
                SizedBox(
                  height: 150,
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
                const SizedBox(height: 14),
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
                    const SizedBox(width: 20),
                    Text(
                      _generateRandomString(),
                      style: AppTextStyles.textStyle15.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                InfoRow(
                  title: 'Name',
                  info: '${bookingInfo.firstName} ${bookingInfo.surname}',
                ),
                const SizedBox(height: 15),
                InfoRow(
                  title: 'Email',
                  info: bookingInfo.email!,
                ),
                const SizedBox(height: 15),
                InfoRow(
                  title: 'Phone',
                  info: bookingInfo.phoneNumber!,
                ),
                const SizedBox(height: 20),
                CheckInAndOut(
                  checkInDate: bookingInfo.checkInDate!,
                  checkOutDate: bookingInfo.checkOutDate!,
                ),
                const SizedBox(height: 20),
                InfoRow(
                  title: 'Room Type',
                  info: bookingInfo.roomType!,
                  isRoomType: true,
                ),
                const SizedBox(height: 15),
                InfoRow(
                  title: 'Guest',
                  info: bookingInfo.guestNumber!.toString(),
                ),
                const SizedBox(height: 15),
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
