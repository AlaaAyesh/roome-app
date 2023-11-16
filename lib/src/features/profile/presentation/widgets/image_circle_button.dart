import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';

class ImageCircleButton extends StatelessWidget {
  const ImageCircleButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final String icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 16,
          backgroundColor: state.brightness == Brightness.light
              ? Colors.white
              : AppColors.darkGreyColor,
          shape: const CircleBorder(),
          fixedSize: const Size(150, 130),
        ),
        child: Image.asset(
          icon,
          width: 180,
          height: 100,
        ),
      ),
    );
  }
}
