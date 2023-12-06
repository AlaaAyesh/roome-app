import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/core/widgets/custom_sliver_app_bar.dart';
import 'package:roome/src/core/widgets/main_button.dart';
import 'package:roome/src/features/booking/data/models/booking_info.dart';
import 'package:roome/src/features/booking/presentation/widgets/booking_info_container.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key, required this.bookingInfo});

  final BookingInfo bookingInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FadeInUp(
          from: AppConstants.fadeInUpValue,
          child: CustomScrollView(
            slivers: [
              const CustomSliverAppBar(
                titleText: 'Ticket',
                centerTitle: true,
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 31.w),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 35.h),
                      BookingInfoContainer(bookingInfo: bookingInfo),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 31.w),
                sliver: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: <Widget>[
                      const BottomSpacer(),
                      const Spacer(),
                      MainButton(
                        text: 'Download Ticket',
                        onPressed: () {},
                        backgroundColor: AppColors.grey,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0, 4.h),
                            blurRadius: 4,
                            color: AppColors.primaryColor.withOpacity(0.15),
                          ),
                        ],
                      ),
                      const BottomSpacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
