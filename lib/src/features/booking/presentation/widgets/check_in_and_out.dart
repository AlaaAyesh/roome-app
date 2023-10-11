import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import 'check_container.dart';
import 'section_title.dart';

class CheckInAndOut extends StatelessWidget {
  const CheckInAndOut({
    super.key,
    required this.checkInDate,
    required this.checkOutDate,
  });

  final String checkInDate;
  final String checkOutDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            const SectionTitle(title: 'Check In'),
            SizedBox(width: SizeConfig.screenWidth! * 0.33),
            const SectionTitle(title: 'Check Out'),
          ],
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.016),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CheckContainer(hint: checkInDate),
            const Icon(Icons.arrow_forward),
            CheckContainer(hint: checkOutDate),
          ],
        )
      ],
    );
  }
}
