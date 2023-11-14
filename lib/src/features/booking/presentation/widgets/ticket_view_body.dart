import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/custom_action_button.dart';
import 'package:roome/src/core/widgets/custom_app_bar.dart';
import 'package:roome/src/features/booking/data/models/booking_info.dart';
import 'package:roome/src/features/booking/presentation/widgets/booking_info_container.dart';

class TicketViewBody extends StatelessWidget {
  final BookingInfo bookingInfo;
  const TicketViewBody({super.key, required this.bookingInfo});

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
                spaceBetween: 90,
                title: 'Ticket',
                arrowOnTap: () => context.getBack(),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.035),
              BookingInfoContainer(bookingInfo: bookingInfo),
              SizedBox(height: SizeConfig.screenHeight! * 0.04),
              CustomActionButton(
                buttonText: 'Download Ticket',
                onPressed: () {},
                textStyle: AppTextStyles.textStyle15.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                backgroundColor: AppColors.grey,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(0, 4.w),
                    blurRadius: 4.w,
                    color: AppColors.primaryColor.withOpacity(0.15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
