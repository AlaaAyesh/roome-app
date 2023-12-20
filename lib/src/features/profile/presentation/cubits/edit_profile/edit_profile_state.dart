part of 'edit_profile_cubit.dart';

abstract class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object?> get props => [];
}

class EditProfileInitial extends EditProfileState {
  const EditProfileInitial();
}

class UpdateUserLoadingState extends EditProfileState {
  const UpdateUserLoadingState();
}

class UpdateUserSuccessState extends EditProfileState {
  final UserModel user;

  const UpdateUserSuccessState({required this.user});

  @override
  List<Object> get props => [user];
}

class UpdateUserErrorState extends EditProfileState {
  final String error;

  const UpdateUserErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class ProfileImagePickedSuccessState extends EditProfileState {
  const ProfileImagePickedSuccessState();
}

class ProfileImagePickedErrorState extends EditProfileState {
  const ProfileImagePickedErrorState();
}

class UploadingProfileImageLoadingState extends EditProfileState {
  const UploadingProfileImageLoadingState();
}

class UploadProfileImageSuccessState extends EditProfileState {
  final String profileImageUrl;

  const UploadProfileImageSuccessState({required this.profileImageUrl});

  @override
  List<Object> get props => [profileImageUrl];
}

class UploadProfileImageErrorState extends EditProfileState {
  final String error;

  const UploadProfileImageErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class SwitchEditPassVisibleState extends EditProfileState {
  final bool passVisibility;

  const SwitchEditPassVisibleState({required this.passVisibility});

  @override
  List<Object> get props => [passVisibility];
}
