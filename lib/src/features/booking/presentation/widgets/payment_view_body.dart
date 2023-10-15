import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/custom_app_bar.dart';
import 'package:roome/src/core/widgets/custom_action_button.dart';
import 'package:roome/src/features/booking/data/models/booking_info.dart';
import 'package:roome/src/features/booking/presentation/widgets/section_title.dart';
import 'package:roome/src/features/notifications/presentation/cubit/notifications_cubit.dart';

import '../../../../config/services/notification_service.dart';
import 'payment_dialog.dart';
import 'other_payment_method.dart';

class PaymentViewBody extends StatelessWidget {
  final BookingInfo bookingInfo;

  const PaymentViewBody({super.key, required this.bookingInfo});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: AppConstants.fadeInUpValue,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: 42.h,
            left: 31.w,
            right: 31.w,
            bottom: 14.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomAppBar(
                spaceBetween: 100,
                title: 'Payment',
                arrowOnTap: () => context.getBack(),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.031),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SectionTitle(title: 'My Card'),
                  CustomTextButton(
                    onTap: () {},
                    child: Text(
                      'Edit Card',
                      style: AppTextStyles.hintStyle.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.018),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                child: SvgPicture.asset(
                  AppAssets.imageCreditCard,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.04),
              const SectionTitle(title: 'Other Payment Method'),
              SizedBox(height: SizeConfig.screenHeight! * 0.036),
              const OtherPaymentMethod(
                icon: AppAssets.iconNewCredit,
                text: 'New credit/Debit Card',
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.035),
              const OtherPaymentMethod(
                icon: AppAssets.iconPaypal,
                text: 'Paypal',
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.1),
              CustomActionButton(
                buttonText: 'Continue',
                onPressed: () {
                  _handleSuccessNotifications(context);

                  showAdaptiveDialog(
                    context: context,
                    builder: (context) =>
                        PaymentDialog(bookingInfo: bookingInfo),
                  );
                },
                textStyle: AppTextStyles.textStyle15.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                backgroundColor: AppColors.primaryColor,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.015),
              CustomActionButton(
                buttonText: 'Cancel Booking',
                onPressed: () {
                  _handleCancelNotifications(context);

                  context.getBack();
                },
                textStyle: AppTextStyles.textStyle15.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                backgroundColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleCancelNotifications(BuildContext context) {
    NotificationService.triggerNotification(
      title: AppStrings.hotelBookingCanceled,
      body: 'You have canceled ${bookingInfo.hotelName} booking',
    );

    BlocProvider.of<NotificationsCubit>(context).addToNotifications(
      context: context,
      circles: AppAssets.imageRedCircles,
      icon: AppAssets.iconHotelBookingCanceledIcon,
      color: Colors.red,
      title: AppStrings.hotelBookingCanceled,
      body: 'You have canceled ${bookingInfo.hotelName} booking',
    );
  }

  void _handleSuccessNotifications(BuildContext context) {
    NotificationService.triggerNotification(
      title: AppStrings.paymentSuccessful,
      body: '${bookingInfo.hotelName} was booking successfully',
    );

    BlocProvider.of<NotificationsCubit>(context).addToNotifications(
      context: context,
      circles: AppAssets.imageGreenCircles,
      icon: AppAssets.iconPaymentSuccessfulIcon,
      color: Colors.green,
      title: AppStrings.paymentSuccessful,
      body: '${bookingInfo.hotelName} was booking successfully',
    );
  }
}
