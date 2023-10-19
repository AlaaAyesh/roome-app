import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/utils/app_colors.dart';
import '/src/config/themes/cubit/themes_cubit.dart';
import 'form_number.dart';

class BookingOneFormNumbers extends StatelessWidget {
  const BookingOneFormNumbers({super.key, required this.isBookingOne});

  final bool isBookingOne;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.w),
      child: BlocBuilder<ThemesCubit, ThemeData>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FormNumber(
                number: 1,
                backgroundColor: isBookingOne
                    ? AppColors.primaryColor.withOpacity(0.47)
                    : HexColorHandler('CFC4C4'),
              ),
              SizedBox(width: SizeConfig.screenWidth! * 0.15),
              FormNumber(
                number: 2,
                backgroundColor: isBookingOne
                    ? HexColorHandler('CFC4C4')
                    : AppColors.primaryColor.withOpacity(0.47),
              ),
            ],
          );
        },
      ),
    );
  }
}
