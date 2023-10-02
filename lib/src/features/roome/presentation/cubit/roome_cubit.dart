import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/entities/no_params.dart';

import 'package:roome/src/core/models/user_model.dart';

import 'package:roome/src/features/roome/domain/entities/change_index_params.dart';
import 'package:roome/src/features/roome/domain/entities/user_entity.dart';
import 'package:roome/src/features/roome/domain/usecases/change_bottom_nav_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/change_nav_to_home_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/get_body_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/get_bottom_nav_items_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/get_user_data_usecase.dart';

import '../../../../core/helpers/helper.dart';

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
  }) : super(RoomeInitial());

  static RoomeCubit getObject(context) => BlocProvider.of<RoomeCubit>(context);

  List<Widget> getBody() => getBodyUseCse(NoParams());

  List<BottomNavigationBarItem> getBottomNavItems() =>
      getBottomNavItemsUseCase(NoParams());

  int currentIndex = 0;

  void changeBottomNavIndex(int index, BuildContext context) {
    changeBottomNavUseCase(ChangeIndexParams(
      context: context,
      index: index,
    ));

    emit(ChangeBottomNavState(index: index));
  }

  void changeBottomNavToHome(BuildContext context) {
    changeBottomNavToHomeUseCase(ChangeIndexParams(context: context));

    emit(ChangeBottomNavToHome());
  }

  void getUserData() {
    emit(GetUserDataLoadingState());
    getUserDataUseCase(UserEntity(id: int.parse(Helper.uId!))).then((value) {
      value.fold(
        (failure) =>
            GetUserDataErrorState(error: failure.errorMessage.toString()),
        (user) {
          Helper.userModel = user;
          return GetUserDataSuccessState(userModel: Helper.userModel!);
        },
      );
    });
  }
}
