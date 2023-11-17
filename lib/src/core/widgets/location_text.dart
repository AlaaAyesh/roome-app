import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class LocationText extends StatelessWidget {
  const LocationText({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Icon(
          Icons.location_on_outlined,
          color: AppColors.primaryColor,
          size: 16,
        ),
        const SizedBox(width: 5),
        BlocBuilder<ThemesCubit, ThemeData>(
          builder: (context, state) {
            return Flexible(
              child: Text(
                location,
                style: AppTextStyles.textStyle14Medium.copyWith(
                  fontSize: 13,
                  color: state.brightness == Brightness.light
                      ? AppColors.lightGrey.withOpacity(0.24)
                      : AppColors.white60,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ),
      ],
    );
  }
}
