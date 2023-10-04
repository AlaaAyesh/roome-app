import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/user_model.dart';

abstract class RoomRepo {
  void changeBottomNavIndex({
    required BuildContext context,
    required int index,
  });

  void changeBottomNavToHome({required BuildContext context});

  List<Widget> getBody();

  List<BottomNavigationBarItem> getBottomNavItems();

  Future<Either<Failure, UserModel>> getUserData({required int userId});

  Future<Either<Failure, bool>> signOut({required BuildContext context});
}
