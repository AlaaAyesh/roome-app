import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class LocationTextButton extends StatefulWidget {
  const LocationTextButton({super.key});

  @override
  State<LocationTextButton> createState() => _LocationTextButtonState();
}

class _LocationTextButtonState extends State<LocationTextButton> {
  bool isLocationTapped = false;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        setState(() {
          isLocationTapped = true;
        });

        await Future.delayed(const Duration(milliseconds: 200), () {
          context.navigateTo(routeName: Routes.locationMapViewRoute);
          setState(() {
            isLocationTapped = false;
          });
        });
      },
      icon: const Icon(
        Icons.location_on_outlined,
        color: AppColors.primaryColor,
        size: 19,
      ),
      label: BlocBuilder<ThemesCubit, ThemeData>(
        builder: (context, state) {
          return Text(
            'Location',
            style: AppTextStyles.textStyle14Medium.copyWith(
              fontSize: 13,
              color: isLocationTapped
                  ? AppColors.primaryColor
                  : state.brightness == Brightness.light
                      ? AppColors.lightGrey.withOpacity(0.24)
                      : AppColors.white60,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );
        },
      ),
    );
  }
}
