import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/features/profile/presentation/widgets/edit_image_bottom_sheet.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomeCubit, RoomeState>(
      builder: (context, state) {
        RoomeCubit cubit = RoomeCubit.getObject(context);
        return Align(
          alignment: Alignment.center,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: <Widget>[
              CircleAvatar(
                radius: 80,
                backgroundColor: AppColors.primaryColor.withOpacity(0.24),
                child: CircleAvatar(
                  backgroundImage: (cubit.profileImage == null
                      ? NetworkImage(Helper.currentUser!.profileImage!)
                      : FileImage(cubit.profileImage!)) as ImageProvider,
                  radius: 65,
                  backgroundColor: AppColors.primaryColor,
                ),
              ),
              Positioned(
                right: 30,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () => EditProfileImageBottomSheet.buildBottomSheet(
                        context: context,
                        onPressedGallery: () {
                          cubit.getProfileImage(source: ImageSource.gallery);
                        },
                        onPressedCamera: () {
                          cubit.getProfileImage(source: ImageSource.camera);
                        },
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
