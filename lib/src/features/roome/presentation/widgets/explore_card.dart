import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_error_icon.dart';

class ExploreCard extends StatelessWidget {
  const ExploreCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.15,
      width: SizeConfig.screenWidth! * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1.15.w),
            blurRadius: 6.89.w,
            color: AppColors.shadowColor,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              child: CachedNetworkImage(
                imageUrl:
                    'https://www.savills.co.uk/_images/adobestock-539646437-2500.jpg',
                height: SizeConfig.screenHeight! * 0.14,
                width: SizeConfig.screenWidth! * 0.15,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const CustomErrorIcon(),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '430 Hotels',
                style: AppTextStyles.textStyle14Medium.copyWith(
                  fontSize: 13.sp,
                  color: AppColors.lightGrey..withOpacity(0.55),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              Text(
                'In',
                style: AppTextStyles.textStyle14Medium.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.lightGrey..withOpacity(0.55),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.017),
              Text(
                'Cairo',
                style: AppTextStyles.bottomNavTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
