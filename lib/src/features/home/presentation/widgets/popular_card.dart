import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/models/hotel.dart';
import '../../../../core/models/using_hero_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_error_icon.dart';
import '../../../../core/widgets/love_border_icon.dart';
import '../../../../core/widgets/price_per_night_text.dart';
import '../../../../core/widgets/star_icon.dart';
import '/src/config/themes/cubit/themes_cubit.dart';
import '/src/core/utils/app_navigator.dart';

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
            height: SizeConfig.screenHeight! * 0.16,
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
                        imageUrl: hotel.images![0].path!,
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
                            LoveBorderIcon(
                              hotel: hotel,
                              iconSize: 18,
                              borderColor: state.brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ],
                        ),
                        Flexible(
                          child: Text(
                            hotel.location!,
                            style: AppTextStyles.textStyle14Medium.copyWith(
                              color: state.brightness == Brightness.light
                                  ? AppColors.lightGrey.withOpacity(0.49)
                                  : AppColors.white38,
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
