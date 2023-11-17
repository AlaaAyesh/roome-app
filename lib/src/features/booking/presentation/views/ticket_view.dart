import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/core/widgets/custom_action_button.dart';
import 'package:roome/src/core/widgets/custom_sliver_app_bar.dart';
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
                padding: const EdgeInsets.symmetric(horizontal: 31),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 35),
                      BookingInfoContainer(bookingInfo: bookingInfo),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 31),
                sliver: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
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
                            offset: const Offset(0, 4),
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
