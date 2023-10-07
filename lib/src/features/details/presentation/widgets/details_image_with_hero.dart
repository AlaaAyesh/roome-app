import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_navigator.dart';

import '../../../../core/models/hotel.dart';
import '../../../../core/widgets/custom_error_icon.dart';
import '../../../../core/widgets/love_icon.dart';
import 'more_details_image.dart';

class DetailsImageWithHero extends StatelessWidget {
  const DetailsImageWithHero({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          child: Hero(
            tag: hotel.id!,
            child: CachedNetworkImage(
              imageUrl:
                  'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp',
              height: SizeConfig.screenHeight! * 0.45,
              width: double.infinity,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const CustomErrorIcon(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 27.h,
            horizontal: 24.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 24.w,
                width: 24.w,
                color: HexColorHandler('A0A0A0'),
                child: Center(
                  child: GestureDetector(
                    onTap: () => context.getBack(),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 18.w,
                    ),
                  ),
                ),
              ),
              LoveIcon(hotel: hotel, favoriteBorder: true),
            ],
          ),
        ),
        Positioned(
          bottom: 19.h,
          right: 19.w,
          child: const Column(
            children: <Widget>[
              MoreDetailsImage(),
              MoreDetailsImage(),
              MoreDetailsImage(),
            ],
          ),
        ),
      ],
    );
  }
}
