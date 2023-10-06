import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/widgets/star_icon.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_error_icon.dart';
import '../../../../core/widgets/price_per_night_text.dart';

import 'location_text_button.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.24,
      width: SizeConfig.screenWidth! * 0.55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13.r)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1.73.w),
            blurRadius: 10.w,
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
                padding: EdgeInsets.all(4.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(18.r)),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp',
                    height: 89.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const CustomErrorIcon(),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 18.w,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.h, right: 10.w, left: 10.w),
            child: Row(
              children: <Widget>[
                Text(
                  'Jaz Dahabeya',
                  style: AppTextStyles.textStyle15.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                const StarIcon(),
                SizedBox(width: 3.w),
                Text(
                  '4.5',
                  style: AppTextStyles.bottomNavTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 7.h),
            child: LocationTextButton(
              onPressed: () {},
              iconSize: 16.w,
              title: 'Dahab',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w, top: 7.h),
            child: const PricePerNightText(),
          ),
        ],
      ),
    );
  }
}
