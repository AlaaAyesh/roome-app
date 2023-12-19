import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/main_button.dart';
import 'package:roome/src/features/profile/presentation/cubits/edit_profile/edit_profile_cubit.dart';

class UpdateImageButtonAndLoading extends StatelessWidget {
  const UpdateImageButtonAndLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        EditProfileCubit cubit = BlocProvider.of<EditProfileCubit>(context);
        var size = MediaQuery.of(context).size;
        return Align(
          alignment: Alignment.center,
          child: FadeInUp(
            from: AppConstants.fadeInUpValue,
            child: Column(
              children: <Widget>[
                if (cubit.profileImage != null &&
                    state is! UploadProfileImageSuccessState) ...[
                  SizedBox(height: 15.h),
                  MainButton(
                    text: 'Update profile Image',
                    onPressed: () {
                      cubit.uploadProfileImage(context: context);
                    },
                    boxShadow: <BoxShadow>[
                      Helper.glowingShadow(),
                    ],
                  ),
                ],
                if (state is UploadingProfileImageLoadingState)
                  SizedBox(height: 10.h),
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
