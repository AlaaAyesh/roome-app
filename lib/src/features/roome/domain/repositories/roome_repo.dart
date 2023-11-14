import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/user_model.dart';
import 'package:roome/src/features/roome/domain/entities/update_user_params.dart';

abstract class RoomeRepo {
  void changeBottomNavIndex({
    required BuildContext context,
    required int index,
  });

  void changeBottomNavToHome({required BuildContext context});

  List<Widget> getBody();

  List<BottomNavigationBarItem> getBottomNavItems();

  Future<Either<Failure, UserModel>> getUserData({required int userId});

  Future<Either<Failure, UserModel>> updateUser({
    required int userId,
    required UpdateUserParams user,
  });

  Future<Either<Failure, XFile?>> getProfileImage({
    required ImageSource source,
  });

  Future<Either<Failure, TaskSnapshot>> uploadProfileImage({
    File? profileImage,
  });

  Future<Either<Failure, bool>> signOut({required BuildContext context});
}
