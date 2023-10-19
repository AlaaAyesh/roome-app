import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '/src/features/roome/presentation/cubit/roome_cubit.dart';
import 'confirm_update_image_button.dart';

class UpdateImageButtonAndLoading extends StatelessWidget {
  const UpdateImageButtonAndLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomeCubit, RoomeState>(
      builder: (context, state) {
        RoomeCubit cubit = RoomeCubit.getObject(context);

        return FadeInUp(
          from: AppConstants.fadeInUpValue,
          child: Column(
            children: <Widget>[
              if (cubit.profileImage != null) ...[
                SizedBox(height: SizeConfig.screenHeight! * 0.015),
                const ConfirmUpdateImageButton(),
              ],
              if (state is UploadingProfileImageLoadingState)
                SizedBox(height: SizeConfig.screenHeight! * 0.01),
              if (state is UploadingProfileImageLoadingState)
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.4,
                  child: const LinearProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              if (cubit.profileImage != null)
                SizedBox(height: SizeConfig.screenHeight! * 0.01),
            ],
          ),
        );
      },
    );
  }
}
