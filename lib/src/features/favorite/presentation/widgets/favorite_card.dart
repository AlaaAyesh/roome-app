import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/features/favorite/presentation/widgets/remove_from_fav_bottom_sheet.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/models/hotel.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_error_icon.dart';
import '../../../../core/widgets/price_per_night_text.dart';
import '../../../../core/widgets/star_icon.dart';
import '../../../../core/models/using_hero_model.dart';
import '../cubit/favorite_cubit.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.hotel,
    required this.cubit,
  });

  final FavoriteCubit cubit;
  final Hotel hotel;

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
            height: SizeConfig.screenHeight! * 0.15,
            width: SizeConfig.screenWidth! * 0.9,
            decoration: BoxDecoration(
              color: state.brightness == Brightness.light
                  ? Colors.white
                  : AppColors.darkGreyColor,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              border: Border.all(
                color: AppColors.borderColor,
                width: 1.w,
              ),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    right: 10.w,
                    left: 5.w,
                    top: 5.h,
                    bottom: 5.h,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(19.r)),
                    child: Hero(
                      tag: hotel.id!,
                      child: CachedNetworkImage(
                        imageUrl:
                            '${EndPoints.imageBaseUrl}${hotel.images![0].path}',
                        height: 98.h,
                        width: 155.w,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            const CustomErrorIcon(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.w, top: 7.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            GestureDetector(
                              onTap: () {
                                RemoveFromFavBottomSheet.show(
                                  cubit: cubit,
                                  context: context,
                                  hotel: hotel,
                                );
                              },
                              child: Icon(
                                Icons.favorite,
                                color: AppColors.primaryColor,
                                size: 17.w,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.screenHeight! * 0.012),
                        Flexible(
                          child: Text(
                            hotel.location!,
                            style: AppTextStyles.textStyle14Medium.copyWith(
                              color: state.brightness == Brightness.light
                                  ? AppColors.lightGrey.withOpacity(0.49)
                                  : AppColors.white60,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenHeight! * 0.012),
                        PricePerNightText(
                          price: hotel.price,
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                        SizedBox(height: SizeConfig.screenHeight! * 0.0012),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            const StarIcon(),
                            SizedBox(width: 7.w),
                            Text(
                              hotel.rate!.toString(),
                              style: AppTextStyles.appBarTextStyle.copyWith(
                                color: state.brightness == Brightness.light
                                    ? Colors.black.withOpacity(0.53)
                                    : Colors.white,
                                fontSize: 17.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
