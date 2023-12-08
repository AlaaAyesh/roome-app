import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/router/routes.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/models/hotel.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/core/widgets/glowing_custom_button.dart';
import 'package:roome/src/core/widgets/location_text.dart';
import 'package:roome/src/core/widgets/price_per_night_text.dart';
import 'package:roome/src/features/booking/data/models/booked_hotel_info.dart';
import 'package:roome/src/features/details/presentation/widgets/details_image.dart';
import 'package:roome/src/features/details/presentation/widgets/details_image_with_hero.dart';
import 'package:roome/src/features/details/presentation/widgets/details_section_title.dart';
import 'package:roome/src/features/details/presentation/widgets/facilities.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({
    super.key,
    required this.hotel,
    required this.usingHero,
  });

  final Hotel hotel;
  final bool usingHero;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return CustomScrollView(
          physics: AppConstants.physics,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.horizontalViewPaddingValue,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    usingHero
                        ? DetailsImageWithHero(hotel: hotel)
                        : DetailsImage(hotel: hotel),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.only(left: 9.w),
                      child: FadeInUp(
                        from: AppConstants.fadeInUpValue,
                        duration: const Duration(milliseconds: 500),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              hotel.name!,
                              style: AppTextStyles.appBarTextStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                color: state.brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                            SizedBox(height: 14.h),
                            LocationText(location: hotel.location!),
                            SizedBox(height: 14.h),
                            const DetailsSectionTitle(title: 'Description'),
                            SizedBox(height: 14.h),
                            Text(
                              hotel.description!,
                              style: AppTextStyles.textStyle14Medium.copyWith(
                                fontSize: 13.sp,
                                color: state.brightness == Brightness.light
                                    ? AppColors.lightGrey.withOpacity(0.49)
                                    : AppColors.white38,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            const DetailsSectionTitle(title: 'Facilities'),
                            SizedBox(height: 20.h),
                            Facilities(facilities: hotel.facilities!),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.horizontalViewPaddingValue,
              ),
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: <Widget>[
                    const BottomSpacer(),
                    const Spacer(),
                    Row(
                      children: <Widget>[
                        PricePerNightText(
                          price: hotel.price,
                          fontSize: 20,
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: GlowingCustomButton(
                            onPressed: () => context.navigateTo(
                              routeName: Routes.bookingOneViewRoute,
                              arguments: BookedHotelInfo(
                                hotelName: hotel.name,
                                price: hotel.price,
                              ),
                            ),
                            buttonText: 'Book Now',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
