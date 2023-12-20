import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/entities/no_params.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/models/user/user.dart';
import 'package:roome/src/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:roome/src/features/roome/domain/entities/change_index_params.dart';
import 'package:roome/src/features/roome/domain/usecases/change_bottom_nav_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/change_nav_to_home_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/get_body_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/get_bottom_nav_items_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/get_user_data_usecase.dart';

part 'roome_state.dart';

class RoomeCubit extends Cubit<RoomeState> {
  final GetUserDataUseCase getUserDataUseCase;
  final ChangeBottomNavUseCase changeBottomNavUseCase;
  final ChangeBottomNavToHomeUseCase changeBottomNavToHomeUseCase;
  final GetBodyUseCse getBodyUseCse;
  final GetBottomNavItemsUseCase getBottomNavItemsUseCase;

  RoomeCubit({
    required this.changeBottomNavUseCase,
    required this.changeBottomNavToHomeUseCase,
    required this.getBodyUseCse,
    required this.getBottomNavItemsUseCase,
    required this.getUserDataUseCase,
  }) : super(const RoomeInitial());

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

    emit(const ChangeBottomNavToHome());
  }

  void getUserData() {
    emit(const GetUserDataLoadingState());

    getUserDataUseCase(Helper.uId).then((value) {
      value.fold(
        (failure) {
          emit(GetUserDataErrorState(error: failure.failureMsg.toString()));
        },
        (user) {
          Helper.currentUser = user;
          emit(GetUserDataSuccessState(userModel: user));
        },
      );
    });
  }
}
