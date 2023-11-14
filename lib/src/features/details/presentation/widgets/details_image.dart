import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/models/hotel.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/widgets/custom_error_icon.dart';
import 'package:roome/src/core/widgets/love_border_icon.dart';
import 'package:roome/src/features/details/presentation/widgets/more_details_images.dart';

class DetailsImage extends StatelessWidget {
  const DetailsImage({
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
          child: CachedNetworkImage(
            imageUrl: hotel.images![0].path!,
            height: SizeConfig.screenHeight! * 0.45,
            width: double.infinity,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const CustomErrorIcon(),
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
              LoveBorderIcon(
                hotel: hotel,
                iconSize: 24,
                borderColor: Colors.white,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 19.h,
          right: 19.w,
          child: Column(
            children: List.generate(
              Helper.getLength(hotel.images!),
              (index) => MoreDetailsImages(
                index: index,
                lastIndex: Helper.getLength(hotel.images!) - 1,
                imagesNumber: Helper.getLength(hotel.images!),
                hotel: hotel,
                image: hotel.images![index].path!,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
