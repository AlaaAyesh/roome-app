import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/custom_action_button.dart';
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
        return Container(
          height: SizeConfig.screenHeight! * 0.5,
          width: SizeConfig.screenWidth,
          margin: EdgeInsets.only(
            left: 32.w,
            right: 32.w,
            top: SizeConfig.screenHeight! * 0.25,
            bottom: 50.h,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 42.h,
            horizontal: 10.w,
          ),
          decoration: BoxDecoration(
            color: state.brightness == Brightness.light
                ? Colors.white
                : AppColors.darkGreyColor,
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      AppAssets.imageGreyCircles,
                      fit: BoxFit.contain,
                    ),
                    Container(
                      height: 110.w,
                      width: 110.w,
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
                SizedBox(height: SizeConfig.screenHeight! * 0.032),
                Text(
                  'Payment successful !',
                  style: AppTextStyles.appBarTextStyle.copyWith(
                    color: state.brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.014),
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
                SizedBox(height: SizeConfig.screenHeight! * 0.031),
                CustomActionButton(
                  buttonText: 'View Booking Ticket',
                  onPressed: () {
                    context.navigateTo(
                      routeName: Routes.ticketViewRoute,
                      arguments: bookingInfo,
                    );
                  },
                  textStyle: AppTextStyles.textStyle15.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  backgroundColor: AppColors.primaryColor,
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.018),
                CustomActionButton(
                  buttonText: 'Cancel',
                  onPressed: () => context.getBack(),
                  textStyle: AppTextStyles.textStyle15.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  backgroundColor: AppColors.grey,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
