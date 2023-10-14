import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';

class VisibilityIconButton extends StatelessWidget {
  const VisibilityIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return Material(
          color: Colors.transparent,
          child: IconButton(
            splashColor: AppColors.textFieldIconColor.withOpacity(0.2),
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: AppColors.primaryColor,
            ),
          ),
        );
      },
    );
  }
}
