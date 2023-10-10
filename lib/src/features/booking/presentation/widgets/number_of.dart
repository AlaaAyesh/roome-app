import 'package:flutter/material.dart';

import 'package:roome/src/core/utils/app_text_styles.dart';

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
          Text(
            number.toString(),
            style: AppTextStyles.bottomNavTextStyle.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.black.withOpacity(0.62),
            ),
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
