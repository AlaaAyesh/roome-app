import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:reusable_components/reusable_components.dart';

import '../../../../core/helpers/helper.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../data/models/booking_info.dart';
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
    return Container(
      height: SizeConfig.screenHeight! * 0.7,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        border: Border.all(
          color: HexColorHandler('E3E3E4'),
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Text(
              bookingInfo.hotelName!,
              style: AppTextStyles.appBarTextStyle.copyWith(
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.014),
          Image.asset(
            AppAssets.imageQrCode,
            fit: BoxFit.cover,
            height: 150.h,
            width: 200.w,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.023),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Booking ID:',
                style: AppTextStyles.textStyle15.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.46),
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth! * 0.02),
              Text(
                '029Wf52QM',
                style: AppTextStyles.textStyle15.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.03),
          InfoRow(
            title: 'Name',
            info:
                '${Helper.currentUser!.firstName}${Helper.currentUser!.lastName}',
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.015),
          InfoRow(
            title: 'Email',
            info: Helper.currentUser!.email!,
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
    );
  }
}
