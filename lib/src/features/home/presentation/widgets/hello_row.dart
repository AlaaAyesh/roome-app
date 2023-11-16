import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/home/presentation/widgets/location_text_button.dart';

class HelloRow extends StatelessWidget {
  const HelloRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: Helper.currentUser!.profileImage!,
          imageBuilder: (_, image) {
            return CircleAvatar(
              backgroundImage: image,
              radius: 19,
              backgroundColor: AppColors.primaryColor,
            );
          },
        ),
        const SizedBox(width: 16),
        const Text(AppStrings.waveEmoji),
        const SizedBox(width: 5),
        Text(
          'Hello, ${Helper.currentUser!.firstName}',
          style: AppTextStyles.textStyle15.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        const LocationTextButton(),
      ],
    );
  }
}
