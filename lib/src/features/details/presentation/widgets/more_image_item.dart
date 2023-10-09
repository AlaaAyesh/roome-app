import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/widgets/custom_error_icon.dart';

class MoreImageItem extends StatelessWidget {
  const MoreImageItem({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        child: CachedNetworkImage(
          imageUrl: image,
          height: SizeConfig.screenHeight! * 0.049,
          width: 64.w,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const CustomErrorIcon(),
        ),
      ),
    );
  }
}
