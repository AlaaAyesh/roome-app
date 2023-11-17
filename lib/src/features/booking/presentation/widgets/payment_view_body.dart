import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roome/src/config/services/notification_service.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/core/widgets/custom_action_button.dart';
import 'package:roome/src/core/widgets/custom_sliver_app_bar.dart';
import 'package:roome/src/features/booking/data/models/booking_info.dart';
import 'package:roome/src/features/booking/presentation/cubits/payment/payment_cubit.dart';
import 'package:roome/src/features/booking/presentation/widgets/other_payment_method.dart';
import 'package:roome/src/features/booking/presentation/widgets/payment_dialog.dart';
import 'package:roome/src/features/booking/presentation/widgets/section_title.dart';
import 'package:roome/src/features/notifications/presentation/cubit/notifications_cubit.dart';

class PaymentViewBody extends StatelessWidget {
  final BookingInfo bookingInfo;

  const PaymentViewBody({super.key, required this.bookingInfo});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: AppConstants.fadeInUpValue,
      child: BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) => CustomScrollView(
                physics: AppConstants.physics,
                slivers: [
                  const CustomSliverAppBar(
                      titleText: 'Payment', centerTitle: true),
                  SliverPadding(
                    padding: const EdgeInsets.only(left: 31, right: 31),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const SectionTitle(title: 'My Card'),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Edit Card',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            child: SvgPicture.asset(
                              AppAssets.imageCreditCard,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 40),
                          const SectionTitle(title: 'Other Payment Method'),
                          const SizedBox(height: 36),
                          const OtherPaymentMethod(
                            icon: AppAssets.iconNewCredit,
                            text: 'New credit/Debit Card',
                          ),
                          const SizedBox(height: 35),
                          const OtherPaymentMethod(
                            icon: AppAssets.iconPaypal,
                            text: 'Paypal',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(left: 31, right: 31),
                    sliver: SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: <Widget>[
                          const Spacer(),
                          CustomActionButton(
                            buttonText: 'Continue',
                            onPressed: () {
                              _handleSuccessNotifications(context);

                              showAdaptiveDialog(
                                context: context,
                                builder: (context) =>
                                    PaymentDialog(bookingInfo: bookingInfo),
                              );

                              BlocProvider.of<PaymentCubit>(context)
                                  .convertContinue();
                            },
                            textStyle: AppTextStyles.textStyle15.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            backgroundColor: AppColors.primaryColor,
                          ),
                          const SizedBox(height: 15),
                          if (BlocProvider.of<PaymentCubit>(context)
                                  .isContinueTapped ==
                              false)
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
                          const BottomSpacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
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
