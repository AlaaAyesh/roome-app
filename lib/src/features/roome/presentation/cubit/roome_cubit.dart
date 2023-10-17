import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/core/entities/no_params.dart';
import 'package:roome/src/core/models/user_model.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/features/roome/domain/entities/change_index_params.dart';
import 'package:roome/src/features/roome/domain/entities/sign_out_params.dart';
import 'package:roome/src/features/favorite/domain/entities/user_params.dart';
import 'package:roome/src/features/roome/domain/entities/update_user_params.dart';
import 'package:roome/src/features/roome/domain/usecases/update_user_usecase.dart';

import '../../../../core/helpers/helper.dart';
import '../../../favorite/presentation/cubit/favorite_cubit.dart';
import '../../domain/usecases/change_bottom_nav_usecase.dart';
import '../../domain/usecases/change_nav_to_home_usecase.dart';
import '../../domain/usecases/get_body_usecase.dart';
import '../../domain/usecases/get_bottom_nav_items_usecase.dart';
import '../../domain/usecases/get_profile_image_usecase.dart';
import '../../domain/usecases/get_user_data_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';

part 'roome_state.dart';

class RoomeCubit extends Cubit<RoomeState> {
  final GetUserDataUseCase getUserDataUseCase;
  final ChangeBottomNavUseCase changeBottomNavUseCase;
  final ChangeBottomNavToHomeUseCase changeBottomNavToHomeUseCase;
  final GetBodyUseCse getBodyUseCse;
  final GetBottomNavItemsUseCase getBottomNavItemsUseCase;
  final UpdateUserUseCase updateUserUseCase;
  final GetProfileImageUseCase getProfileImageUseCase;
  final SignOutUseCase signOutUseCase;

  RoomeCubit({
    required this.changeBottomNavUseCase,
    required this.changeBottomNavToHomeUseCase,
    required this.getBodyUseCse,
    required this.getBottomNavItemsUseCase,
    required this.getUserDataUseCase,
    required this.updateUserUseCase,
    required this.getProfileImageUseCase,
    required this.signOutUseCase,
  }) : super(RoomeInitial());

  static RoomeCubit getObject(context) => BlocProvider.of<RoomeCubit>(context);

  List<Widget> getBody() {
    return getBodyUseCse(const NoParams());
  }

  List<BottomNavigationBarItem> getBottomNavItems() =>
      getBottomNavItemsUseCase(const NoParams());

  int currentIndex = 0;

  void changeBottomNavIndex(int index, BuildContext context) {
    currentIndex = index;

    changeBottomNavUseCase(ChangeIndexParams(
      context: context,
      index: index,
    ));

    if (currentIndex == 0) {
      getUserData();
    }

    if (currentIndex == 2) {
      BlocProvider.of<FavoriteCubit>(context).getFavorites();
    }

    emit(ChangeBottomNavState(index: index));
  }

  void changeBottomNavToHome(BuildContext context) {
    changeBottomNavToHomeUseCase(ChangeIndexParams(context: context));

    emit(ChangeBottomNavToHome());
  }

  void getUserData() {
    emit(GetUserDataLoadingState());

    getUserDataUseCase(UserParams(id: Helper.uId)).then((value) {
      value.fold(
        (failure) {
          emit(GetUserDataErrorState(error: failure.errorMessage.toString()));
        },
        (user) {
          Helper.currentUser = user;
          emit(GetUserDataSuccessState(userModel: user));
        },
      );
    });
  }

  void updateUser({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? username,
    String? email,
    String? profileImage,
    String? occupation,
    String? nationality,
    String? password,
  }) {
    emit(UpdateUserLoadingState());

    updateUserUseCase(UpdateUserParams(
      userId: Helper.uId!,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      email: email,
      username: username,
      password: password,
      profileImage: profileImage,
      occupation: occupation,
      nationality: nationality,
    )).then((value) {
      value.fold(
        (failure) =>
            emit(UpdateUserErrorState(error: failure.errorMessage.toString())),
        (user) {
          getUserData();
          emit(UpdateUserSuccessState(user: user));
        },
      );
    });
  }

  File? profileImage;
  ImagePicker picker = ImagePicker();

  void getProfileImage({required ImageSource source}) {
    getProfileImageUseCase(source).then((value) {
      value.fold(
        (failure) => emit(ProfileImagePickedErrorState()),
        (pickedImage) {
          if (pickedImage != null) {
            profileImage = File(pickedImage.path);
            emit(ProfileImagePickedSuccessState());
          } else {
            ProfileImagePickedErrorState();
          }
        },
      );
    });
  }

  void signOut(BuildContext context) {
    signOutUseCase(SignOutParams(context: context)).then((value) {
      value.fold(
        (failure) => SignOutErrorState(error: failure.errorMessage.toString()),
        (success) {
          Helper.uId = null;
          // So when the user login again, he navigates to Home not profile
          currentIndex = 0;
          context.navigateAndRemoveUntil(newRoute: Routes.loginViewRoute);
          return SignOutSuccessState(uId: Helper.uId);
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
