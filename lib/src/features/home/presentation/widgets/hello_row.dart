import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/home/presentation/widgets/location_text_button.dart';

class HelloRow extends StatelessWidget {
  const HelloRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 26.w),
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: Helper.currentUser!.profileImage!,
            imageBuilder: (_, image) {
              return CircleAvatar(
                backgroundImage: image,
                radius: 19.r,
                backgroundColor: AppColors.primaryColor,
              );
            },
          ),
          SizedBox(width: SizeConfig.screenWidth! * 0.016),
          const Text(AppStrings.waveEmoji),
          SizedBox(width: SizeConfig.screenWidth! * 0.016),
          Text(
            'Hello, ${Helper.currentUser!.firstName}',
            style: AppTextStyles.textStyle15.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          const LocationTextButton(),
        ],
      ),
    );
  }
}
