import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/core/entities/no_params.dart';

import 'package:roome/src/core/models/user_model.dart';
import 'package:roome/src/core/utils/app_navigator.dart';

import 'package:roome/src/features/roome/domain/entities/change_index_params.dart';

import 'package:roome/src/features/roome/domain/entities/sign_out_params.dart';
import 'package:roome/src/features/roome/domain/entities/user_params.dart';
import 'package:roome/src/features/roome/domain/usecases/roome/change_bottom_nav_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/roome/change_nav_to_home_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/roome/get_body_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/roome/get_bottom_nav_items_usecase.dart';

import 'package:roome/src/features/roome/domain/usecases/roome/get_user_data_usecase.dart';

import 'package:roome/src/features/roome/domain/usecases/roome/sign_out_usecase.dart';
import 'package:roome/src/features/roome/presentation/cubits/favorite/favorite_cubit.dart';

import '../../../../../core/helpers/helper.dart';

part 'roome_state.dart';

class RoomeCubit extends Cubit<FavoriteState> {
  final GetUserDataUseCase getUserDataUseCase;
  final ChangeBottomNavUseCase changeBottomNavUseCase;
  final ChangeBottomNavToHomeUseCase changeBottomNavToHomeUseCase;
  final GetBodyUseCse getBodyUseCse;
  final GetBottomNavItemsUseCase getBottomNavItemsUseCase;

  final SignOutUseCase signOutUseCase;

  RoomeCubit({
    required this.changeBottomNavUseCase,
    required this.changeBottomNavToHomeUseCase,
    required this.getBodyUseCse,
    required this.getBottomNavItemsUseCase,
    required this.getUserDataUseCase,
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

    if (currentIndex == 3) {
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

  void signOut(BuildContext context) {
    signOutUseCase(SignOutParams(context: context)).then((value) {
      value.fold(
        (failure) => SignOutErrorState(error: failure.errorMessage.toString()),
        (success) {
          Helper.uId = null;
          context.navigateAndRemoveUntil(newRoute: Routes.loginViewRoute);
          return SignOutSuccessState(uId: Helper.uId);
        },
      );
    });
  }
}