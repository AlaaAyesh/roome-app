import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/src/config/themes/cubit/themes_cubit.dart';
import '/src/core/utils/app_text_styles.dart';
import 'custom_bordered_container.dart';
import 'number_controller.dart';

class NumberOfContainer extends StatelessWidget {
  const NumberOfContainer({
    super.key,
    required this.number,
    required this.reduceOnTap,
    required this.increaseOnTap,
  });

  final int number;
  final VoidCallback? reduceOnTap;
  final VoidCallback increaseOnTap;

  @override
  Widget build(BuildContext context) {
    return CustomBorderedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          NumberController(
            icon: Icons.remove,
            onTap: reduceOnTap,
          ),
          BlocBuilder<ThemesCubit, ThemeData>(
            builder: (context, state) {
              return Text(
                number.toString(),
                style: AppTextStyles.bottomNavTextStyle.copyWith(
                  fontWeight: FontWeight.w900,
                  color: state.brightness == Brightness.light
                      ? Colors.black.withOpacity(0.62)
                      : Colors.white,
                ),
              );
            },
          ),
          NumberController(
            icon: Icons.add,
            onTap: increaseOnTap,
          ),
        ],
      ),
    );
  }
}
