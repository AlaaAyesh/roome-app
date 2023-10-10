import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/utils/app_colors.dart';
import 'form_number.dart';

class BookingOneFormNumbers extends StatelessWidget {
  const BookingOneFormNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FormNumber(
            number: 1,
            backgroundColor: AppColors.primaryColor.withOpacity(0.47),
          ),
          SizedBox(width: SizeConfig.screenWidth! * 0.15),
          FormNumber(
            number: 2,
            backgroundColor: HexColorHandler('CFC4C4'),
          ),
        ],
      ),
    );
  }
}
