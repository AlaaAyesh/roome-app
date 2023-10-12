import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.title,
    required this.info,
  });

  final String title;
  final String? info;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title, style: AppTextStyles.textStyle15),
        Flexible(
          child: Text(
            info ?? 'Unknown',
            style: info == null
                ? AppTextStyles.textStyle15.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.46),
                  )
                : AppTextStyles.textStyle15.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
