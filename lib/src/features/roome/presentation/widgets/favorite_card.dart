import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/widgets/custom_bottom_sheet.dart';
import 'package:roome/src/features/roome/presentation/cubits/favorite/favorite_cubit.dart';

import '../../../../core/models/hotel.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_error_icon.dart';
import '../../../../core/widgets/price_per_night_text.dart';
import '../../../../core/widgets/star_icon.dart';

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
    return Container(
      height: SizeConfig.screenHeight! * 0.15,
      width: SizeConfig.screenWidth! * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
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
              child: CachedNetworkImage(
                imageUrl:
                    'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp',
                height: 98.h,
                width: 155.w,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const CustomErrorIcon(),
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
                        color: AppColors.lightGrey.withOpacity(0.49),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.012),
                  const PricePerNightText(
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
                          color: Colors.black.withOpacity(0.53),
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
  }
}
