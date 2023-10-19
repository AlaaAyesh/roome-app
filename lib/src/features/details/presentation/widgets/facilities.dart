import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/models/facility.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '/src/config/themes/cubit/themes_cubit.dart';

class Facilities extends StatelessWidget {
  const Facilities({super.key, required this.facilities});

  final List<Facility> facilities;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.w,
      verticalDirection: VerticalDirection.down,
      direction: Axis.horizontal,
      children: List.generate(
        facilities.length,
        (index) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.network(
              '${EndPoints.iconBaseUrl}${facilities[index].icon!}',
              height: SizeConfig.screenHeight! * 0.04,
              width: SizeConfig.screenHeight! * 0.04,
              fit: BoxFit.cover,
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.009),
            BlocBuilder<ThemesCubit, ThemeData>(
              builder: (context, state) {
                return Text(
                  facilities[index].name!,
                  style: AppTextStyles.textStyle14Medium.copyWith(
                    fontSize: 13.sp,
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
