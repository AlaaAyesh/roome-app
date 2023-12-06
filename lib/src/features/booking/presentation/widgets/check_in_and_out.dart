import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        SizedBox(height: 16.h),
        Row(
          children: <Widget>[
            Expanded(child: CheckContainer(hint: checkInDate)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Icon(Icons.arrow_forward),
            ),
            Expanded(child: CheckContainer(hint: checkOutDate)),
          ],
        )
      ],
    );
  }
}
