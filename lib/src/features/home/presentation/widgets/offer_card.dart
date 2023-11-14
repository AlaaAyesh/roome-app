import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/custom_error_icon.dart';
import 'package:roome/src/features/home/data/models/offer_model.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required this.offerModel,
    required this.index,
  });

  final OfferModel offerModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: index == 0 ? 0 : 10.w),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            child: CachedNetworkImage(
              imageUrl: offerModel.imageUrl,
              fit: BoxFit.cover,
              height: SizeConfig.screenHeight! * 0.12,
              width: SizeConfig.screenWidth! * 0.85,
              errorWidget: (context, url, error) => const CustomErrorIcon(),
            ),
          ),
          Positioned(
            left: 10.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Get',
                  style: AppTextStyles.onBoardingButtonStyle.copyWith(
                    fontSize: 20.sp,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '${offerModel.offer} OFF',
                      style: AppTextStyles.onBoardingButtonStyle.copyWith(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      'on your',
                      style: AppTextStyles.onBoardingButtonStyle.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  'first booking',
                  style: AppTextStyles.onBoardingButtonStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
