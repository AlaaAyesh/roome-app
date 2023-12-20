import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/models/user/user.dart';
import 'package:roome/src/features/profile/domain/entities/update_user_params.dart';
import 'package:roome/src/features/profile/domain/usecases/edit_profile_usecases/get_profile_image_usecase.dart';
import 'package:roome/src/features/profile/domain/usecases/edit_profile_usecases/update_user_usecase.dart';
import 'package:roome/src/features/profile/domain/usecases/edit_profile_usecases/upload_profile_image_usecase.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final UpdateUserUseCase updateUserUseCase;
  final GetProfileImageUseCase getProfileImageUseCase;
  final UploadProfileImageUseCase uploadProfileImageUseCase;

  EditProfileCubit({
    required this.getProfileImageUseCase,
    required this.updateUserUseCase,
    required this.uploadProfileImageUseCase,
  }) : super(const EditProfileInitial());

  void updateUser({
    required UpdateUserParams updateUserParams,
    required BuildContext context,
  }) {
    emit(const UpdateUserLoadingState());

    updateUserUseCase(updateUserParams).then((value) {
      value.fold(
        (failure) =>
            emit(UpdateUserErrorState(error: failure.failureMsg.toString())),
        (user) {
          BlocProvider.of<RoomeCubit>(context).getUserData();
          emit(UpdateUserSuccessState(user: user));
        },
      );
    });
  }

  File? profileImage;

  void getProfileImage({required ImageSource source}) {
    getProfileImageUseCase(source).then((value) {
      value.fold(
        (failure) => emit(const ProfileImagePickedErrorState()),
        (pickedImage) {
          if (pickedImage != null) {
            profileImage = File(pickedImage.path);
            emit(const ProfileImagePickedSuccessState());
          } else {
            const ProfileImagePickedErrorState();
          }
        },
      );
    });
  }

  void uploadProfileImage({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? username,
    String? email,
    String? occupation,
    String? nationality,
    String? password,
    required BuildContext context,
  }) {
    emit(const UploadingProfileImageLoadingState());

    uploadProfileImageUseCase(profileImage).then((value) {
      value.fold(
        (failure) => emit(
          UploadProfileImageErrorState(error: failure.failureMsg.toString()),
        ),
        (taskSnapshot) {
          taskSnapshot.ref.getDownloadURL().then((value) {
            updateUser(
              context: context,
              updateUserParams: UpdateUserParams(
                userId: Helper.uId,
                firstName: firstName,
                lastName: lastName,
                phoneNumber: phoneNumber,
                email: email,
                username: username,
                password: password,
                occupation: occupation,
                nationality: nationality,
                profileImage: value,
              ),
            );
            emit(UploadProfileImageSuccessState(profileImageUrl: value));
          }).catchError((error) {
            emit(UploadProfileImageErrorState(error: error.toString()));
          });
        },
      );
    });
  }

  bool passVisible = true;

  void switchPassVisibility() {
    passVisible = !passVisible;
    emit(SwitchEditPassVisibleState(passVisibility: passVisible));
  }
}
