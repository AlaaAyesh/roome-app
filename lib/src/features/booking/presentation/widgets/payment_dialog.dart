import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          width: double.infinity,
          margin: const EdgeInsets.only(
            left: 32,
            right: 32,
            top: 250,
            bottom: 50,
          ),
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 42,
            bottom: 16,
          ),
          decoration: BoxDecoration(
            color: state.brightness == Brightness.light
                ? Colors.white
                : AppColors.darkGreyColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
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
                    height: 110,
                    width: 110,
                    decoration: const BoxDecoration(
                      color: AppColors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        height: 30,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                'Payment successful !',
                style: AppTextStyles.appBarTextStyle.copyWith(
                  color: state.brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              const SizedBox(height: 8),
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
              const Spacer(),
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
              const SizedBox(height: 16),
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
        );
      },
    );
  }
}
