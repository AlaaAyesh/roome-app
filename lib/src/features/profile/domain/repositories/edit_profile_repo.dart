import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/user/user.dart';
import 'package:roome/src/features/profile/domain/entities/update_user_params.dart';

abstract class EditProfileRepo {
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
}
