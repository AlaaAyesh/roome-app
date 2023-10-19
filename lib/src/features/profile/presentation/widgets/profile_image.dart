import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helpers/helper.dart';
import '../../../../core/utils/app_colors.dart';
import '/src/features/profile/presentation/widgets/edit_image_bottom_sheet.dart';
import '/src/features/roome/presentation/cubit/roome_cubit.dart';

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
              CachedNetworkImage(
                imageUrl: (cubit.profileImage == null
                    ? Helper.currentUser!.profileImage
                    : FileImage(cubit.profileImage!)) as String,
                imageBuilder: (_, image) {
                  return CircleAvatar(
                    radius: 80.r,
                    backgroundColor: AppColors.primaryColor.withOpacity(0.24),
                    child: CircleAvatar(
                      backgroundImage: image,
                      radius: 65.r,
                      backgroundColor: AppColors.primaryColor,
                    ),
                  );
                },
              ),
              Positioned(
                right: 30.w,
                child: Container(
                  height: 24.w,
                  width: 24.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => EditProfileImageBottomSheet.buildBottomSheet(
                        context: context,
                        onPressedGallery: () {
                          cubit.getProfileImage(source: ImageSource.gallery);
                        },
                        onPressedCamera: () {
                          cubit.getProfileImage(source: ImageSource.camera);
                        },
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 17.w,
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
