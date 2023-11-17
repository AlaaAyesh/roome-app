import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/my_custom_button.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class ConfirmUpdateImageButton extends StatelessWidget {
  const ConfirmUpdateImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MyCustomButton(
      onPressed: () {
        BlocProvider.of<RoomeCubit>(context).uploadProfileImage();
      },
      hasPrefix: false,
      backgroundColor: AppColors.primaryColor,
      width: size.width * 0.5,
      height: 48,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      boxShadow: [
        Helper.glowingShadow(),
      ],
      child: Center(
        child: Text(
          'Update profile Image',
          style: AppTextStyles.textStyle15.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
