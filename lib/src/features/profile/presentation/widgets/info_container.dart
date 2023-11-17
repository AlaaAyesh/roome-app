import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/helpers/hex_color_handler.dart';
import 'package:roome/src/core/utils/app_colors.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.child,
    required this.height,
    this.personalErrorHeight,
    this.contactErrorHeight,
    this.isPersonalValidateError = false,
    this.isContactValidateError = false,
  });

  final double height;
  final double? personalErrorHeight;
  final double? contactErrorHeight;
  final Widget child;
  final bool isPersonalValidateError;
  final bool isContactValidateError;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          height: isPersonalValidateError
              ? personalErrorHeight
              : isContactValidateError
                  ? contactErrorHeight
                  : height,
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
            left: 20,
            right: 9,
          ),
          decoration: BoxDecoration(
            color: state.brightness == Brightness.light
                ? Colors.white
                : AppColors.darkGreyColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              color: HexColorHandler('D9D9D9').withOpacity(0.37),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25),
              ),
            ],
          ),
          child: child,
        );
      },
    );
  }
}
