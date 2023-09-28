import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class BookingBody extends StatelessWidget {
  const BookingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Booking',
          style: AppTextStyles.snackBarTitle.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
