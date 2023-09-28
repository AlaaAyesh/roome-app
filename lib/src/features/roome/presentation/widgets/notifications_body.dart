import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Notifications',
          style: AppTextStyles.snackBarTitle.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
