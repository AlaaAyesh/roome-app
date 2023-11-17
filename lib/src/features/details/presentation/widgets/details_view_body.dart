import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/routes/routes.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 22),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    usingHero
                        ? DetailsImageWithHero(hotel: hotel)
                        : DetailsImage(hotel: hotel),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 9),
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
                            const SizedBox(height: 14),
                            LocationText(location: hotel.location!),
                            const SizedBox(height: 14),
                            const DetailsSectionTitle(title: 'Description'),
                            const SizedBox(height: 14),
                            Text(
                              hotel.description!,
                              style: AppTextStyles.textStyle14Medium.copyWith(
                                fontSize: 13,
                                color: state.brightness == Brightness.light
                                    ? AppColors.lightGrey.withOpacity(0.49)
                                    : AppColors.white38,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const DetailsSectionTitle(title: 'Facilities'),
                            const SizedBox(height: 20),
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
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        PricePerNightText(
                          price: hotel.price,
                          fontSize: 20,
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                        GlowingCustomButton(
                          onPressed: () => context.navigateTo(
                            routeName: Routes.bookingOneViewRoute,
                            arguments: BookedHotelInfo(
                              hotelName: hotel.name,
                              price: hotel.price,
                            ),
                          ),
                          buttonText: 'Book Now',
                        ),
                      ],
                    ),
                    const BottomSpacer(),
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
