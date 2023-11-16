import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/models/hotel.dart';
import 'package:roome/src/core/models/using_hero_model.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/custom_error_icon.dart';
import 'package:roome/src/core/widgets/location_text.dart';
import 'package:roome/src/core/widgets/love_icon.dart';
import 'package:roome/src/core/widgets/price_per_night_text.dart';
import 'package:roome/src/core/widgets/star_icon.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
    this.cardHeight,
    this.cardWidth,
    required this.hotel,
  });

  final Hotel hotel;
  final double? cardHeight;
  final double? cardWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateTo(
        routeName: Routes.detailsViewRoute,
        arguments: UsingHeroModel(hotel: hotel, usingHero: true),
      ),
      child: BlocBuilder<ThemesCubit, ThemeData>(
        builder: (context, state) {
          return Container(
            height: cardHeight,
            width: cardWidth,
            decoration: BoxDecoration(
              color: state.brightness == Brightness.light
                  ? Colors.white
                  : AppColors.darkGreyColor,
              borderRadius: const BorderRadius.all(Radius.circular(13)),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1.73),
                  blurRadius: 10,
                  color: AppColors.shadowColor,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                        child: Hero(
                          tag: hotel.id!,
                          child: CachedNetworkImage(
                            imageUrl: hotel.images![0].path!,
                            height: 89,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) =>
                                const CustomErrorIcon(),
                          ),
                        ),
                      ),
                    ),
                    LoveIcon(hotel: hotel),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1, right: 10, left: 10),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          hotel.name!,
                          style: AppTextStyles.textStyle15.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      const StarIcon(),
                      const SizedBox(width: 3),
                      Text(
                        hotel.rate!.toString(),
                        style: AppTextStyles.bottomNavTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 7),
                  child: LocationText(location: hotel.location!),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 7),
                  child: PricePerNightText(price: hotel.price!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
