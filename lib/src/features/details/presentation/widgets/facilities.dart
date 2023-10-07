import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/models/hotel.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_error_icon.dart';

class Facilities extends StatelessWidget {
  const Facilities({super.key, required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.w,
      verticalDirection: VerticalDirection.down,
      direction: Axis.horizontal,
      children: List.generate(
        hotel.facilities!.length,
        (index) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl:
                  'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp',
              height: SizeConfig.screenHeight! * 0.04,
              width: SizeConfig.screenHeight! * 0.04,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const CustomErrorIcon(),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.009),
            Text(
              // To get the first two
              hotel.facilities![index].name!.split(' ').take(2).join(' '),
              style: AppTextStyles.textStyle14Medium.copyWith(
                fontSize: 13.sp,
                color: AppColors.lightGrey.withOpacity(0.49),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
