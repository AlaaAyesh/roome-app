import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/hex_color_handler.dart';
import 'package:roome/src/core/utils/app_colors.dart';

class CustomBorderedContainer extends StatelessWidget {
  const CustomBorderedContainer({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return Container(
          constraints: const BoxConstraints(minHeight: 0),
          width: 150,
          padding: padding,
          decoration: BoxDecoration(
            color: state.brightness == Brightness.light
                ? Colors.white
                : AppColors.darkGreyColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: HexColorHandler('E5E5E5'),
            ),
          ),
          child: child,
        );
      },
    );
  }
}
