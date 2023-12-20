import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:roome/src/config/router/routes.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/models/user/hotel.dart';
import 'package:roome/src/core/models/using_hero_model.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/custom_error_icon.dart';
import 'package:roome/src/core/widgets/love_border_icon.dart';
import 'package:roome/src/core/widgets/price_per_night_text.dart';
import 'package:roome/src/core/widgets/star_icon.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({
    super.key,
    required this.hotel,
  });

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
            constraints: const BoxConstraints(minHeight: 0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: state.brightness == Brightness.light
                  ? Colors.white
                  : AppColors.darkGreyColor,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              border: Border.all(
                color: AppColors.borderColor,
                width: 1,
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
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
                          imageUrl: hotel.images![0].path!,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              const CustomErrorIcon(),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.w, top: 7.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
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
                            LoveBorderIcon(
                              hotel: hotel,
                              iconSize: 18,
                              borderColor: state.brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ],
                        ),
                        Text(
                          hotel.location!,
                          style: AppTextStyles.textStyle14Medium.copyWith(
                            color: state.brightness == Brightness.light
                                ? AppColors.lightGrey.withOpacity(0.49)
                                : AppColors.white38,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 12.h),
                        PricePerNightText(
                          price: hotel.price,
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                        SizedBox(height: 6.h),
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
