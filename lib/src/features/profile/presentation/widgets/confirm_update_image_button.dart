import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class ConfirmUpdateImageButton extends StatelessWidget {
  const ConfirmUpdateImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomButton(
      onPressed: () {
        BlocProvider.of<RoomeCubit>(context).uploadProfileImage();
      },
      hasPrefix: false,
      backgroundColor: AppColors.primaryColor,
      width: SizeConfig.screenWidth! * 0.5,
      height: SizeConfig.screenHeight! * 0.048,
      borderRadius: BorderRadius.all(Radius.circular(16.r)),
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
