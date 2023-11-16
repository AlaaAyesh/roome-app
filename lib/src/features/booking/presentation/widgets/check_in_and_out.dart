import 'package:flutter/material.dart';
import 'package:roome/src/features/booking/presentation/widgets/check_container.dart';
import 'package:roome/src/features/booking/presentation/widgets/section_title.dart';

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
        const Row(
          children: <Widget>[
            SectionTitle(title: 'Check In'),
            Spacer(),
            Expanded(child: SectionTitle(title: 'Check Out')),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: <Widget>[
            Expanded(child: CheckContainer(hint: checkInDate)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.arrow_forward),
            ),
            Expanded(child: CheckContainer(hint: checkOutDate)),
          ],
        )
      ],
    );
  }
}
