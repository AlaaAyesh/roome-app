import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/widgets/custom_error_icon.dart';

class MoreDetailsImage extends StatelessWidget {
  const MoreDetailsImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        child: CachedNetworkImage(
          imageUrl:
              'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp',
          height: SizeConfig.screenHeight! * 0.049,
          width: 64.w,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const CustomErrorIcon(),
        ),
      ),
    );
  }
}
