import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/features/profile/presentation/widgets/confirm_update_image_button.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class UpdateImageButtonAndLoading extends StatelessWidget {
  const UpdateImageButtonAndLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomeCubit, RoomeState>(
      builder: (context, state) {
        RoomeCubit cubit = RoomeCubit.getObject(context);
        var size = MediaQuery.of(context).size;
        return Align(
          alignment: Alignment.center,
          child: FadeInUp(
            from: AppConstants.fadeInUpValue,
            child: Column(
              children: <Widget>[
                if (cubit.profileImage != null &&
                    state is! UploadProfileImageSuccessState) ...[
                  const SizedBox(height: 15),
                  const ConfirmUpdateImageButton(),
                ],
                if (state is UploadingProfileImageLoadingState)
                  const SizedBox(height: 10),
                if (state is UploadingProfileImageLoadingState)
                  SizedBox(
                    width: size.width * 0.4,
                    child: const LinearProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
