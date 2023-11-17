import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/features/auth/presentation/cubit/login/login_cubit.dart';

class RememberMeCheckBox extends StatelessWidget {
  final LoginCubit cubit;

  const RememberMeCheckBox({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => cubit.switchRemembered(),
      child: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 0.56,
          ),
        ),
        child: Center(
          child: cubit.remembered
              ? const Icon(
                  Icons.check,
                  color: AppColors.primaryColor,
                  size: 13,
                )
              : null,
        ),
      ),
    );
  }
}
