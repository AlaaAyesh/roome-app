import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.title,
    required this.info,
    this.isRoomType = false,
  });

  final String title;
  final String info;
  final bool isRoomType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '$title:',
          style: AppTextStyles.textStyle12.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        SizedBox(width: SizeConfig.screenWidth! * 0.2),
        Text(
          info,
          style: isRoomType
              ? AppTextStyles.textStyle14Medium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor.withOpacity(0.94),
                )
              : AppTextStyles.textStyle12.copyWith(
                  fontWeight: FontWeight.w600,
                ),
        ),
      ],
    );
  }
}
