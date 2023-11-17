import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/hex_color_handler.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/features/booking/presentation/widgets/form_number.dart';

class BookingOneFormNumbers extends StatelessWidget {
  const BookingOneFormNumbers({super.key, required this.isBookingOne});

  final bool isBookingOne;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
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
            const SizedBox(width: 50),
            FormNumber(
              number: 2,
              backgroundColor: isBookingOne
                  ? HexColorHandler('CFC4C4')
                  : AppColors.primaryColor.withOpacity(0.47),
            ),
          ],
        );
      },
    );
  }
}
