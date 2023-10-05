import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

import '../../../../core/errors/failure.dart';

import '../../../../core/models/user_model.dart';

abstract class RoomRepo {
  void changeBottomNavIndex({
    required BuildContext context,
    required int index,
  });

  void changeBottomNavToHome({required BuildContext context});

  List<Widget> getBody({
    required RoomeState roomeState,
    required RoomeCubit roomeCubit,
  });

  List<BottomNavigationBarItem> getBottomNavItems();

  Future<Either<Failure, UserModel>> getUserData({required int userId});

  Future<Either<Failure, bool>> signOut({required BuildContext context});
}
