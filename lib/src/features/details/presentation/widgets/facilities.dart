import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/models/facility.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class Facilities extends StatelessWidget {
  const Facilities({super.key, required this.facilities});

  final List<Facility> facilities;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      verticalDirection: VerticalDirection.down,
      direction: Axis.horizontal,
      children: List.generate(
        facilities.length,
        (index) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.network(
              facilities[index].icon!,
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 9),
            BlocBuilder<ThemesCubit, ThemeData>(
              builder: (context, state) {
                return Text(
                  facilities[index].name!,
                  style: AppTextStyles.textStyle14Medium.copyWith(
                    fontSize: 13,
                    color: state.brightness == Brightness.light
                        ? AppColors.lightGrey.withOpacity(0.49)
                        : AppColors.white60,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
