import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roome/src/config/router/routes.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/main_button.dart';
import 'package:roome/src/features/booking/data/models/booking_info.dart';

class PaymentDialog extends StatelessWidget {
  const PaymentDialog({
    super.key,
    required this.bookingInfo,
  });

  final BookingInfo bookingInfo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return Center(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 31.w),
            padding: EdgeInsets.only(top: 50.h, bottom: 20.h),
            decoration: BoxDecoration(
              color: state.brightness == Brightness.light
                  ? Colors.white
                  : AppColors.darkGreyColor,
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      AppAssets.imageGreyCircles,
                      fit: BoxFit.contain,
                    ),
                    Container(
                      height: 110.h,
                      width: 110.h,
                      decoration: const BoxDecoration(
                        color: AppColors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          height: 30.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 33.h),
                Text(
                  'Payment successful !',
                  style: AppTextStyles.appBarTextStyle.copyWith(
                    color: state.brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  'Hi ${Helper.currentUser!.firstName}, Your booking was successful',
                  style: AppTextStyles.textStyle15.copyWith(
                    color: state.brightness == Brightness.light
                        ? AppColors.lightGrey.withOpacity(0.62)
                        : AppColors.white60,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 65.w),
                  child: MainButton(
                    text: 'View Booking Ticket',
                    onPressed: () {
                      context.navigateTo(
                        routeName: Routes.ticketViewRoute,
                        arguments: bookingInfo,
                      );
                    },
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 65.w),
                  child: MainButton(
                    text: 'Cancel',
                    onPressed: () => context.getBack(),
                    textColor: Colors.black,
                    backgroundColor: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
