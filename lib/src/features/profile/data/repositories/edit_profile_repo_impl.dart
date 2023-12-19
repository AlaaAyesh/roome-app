import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/errors/server_failure.dart';
import 'package:roome/src/core/models/user/user.dart';
import 'package:roome/src/core/internet/internet_checker.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/features/profile/data/datasources/edit_profile/edit_profile_datasource.dart';
import 'package:roome/src/features/profile/domain/repositories/edit_profile_repo.dart';
import 'package:roome/src/features/profile/domain/entities/update_user_params.dart';

class EditProfileRepoImpl implements EditProfileRepo {
  final EditProfileDataSource editProfileDataSource;
  final InternetChecker internetChecker;

  const EditProfileRepoImpl({
    required this.editProfileDataSource,
    required this.internetChecker,
  });

  @override
  Future<Either<Failure, UserModel>> updateUser({
    required int userId,
    required UpdateUserParams user,
  }) async {
    if (await internetChecker.isConnected) {
      final response = await editProfileDataSource.updateUser(
        userId: userId,
        user: user,
      );

      if (response.containsKey('message')) {
        return Left(ServerFailure(errorMessage: response['message']));
      } else {
        final UserModel user = UserModel.fromJson(response);

        return Right(user);
      }
    } else {
      return Left(ServerFailure(errorMessage: AppStrings.noInternet));
    }
  }

  @override
  Future<Either<Failure, XFile?>> getProfileImage({
    required ImageSource source,
  }) async {
    try {
      final response =
          await editProfileDataSource.getProfileImage(source: source);

      return Right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TaskSnapshot>> uploadProfileImage({
    File? profileImage,
  }) async {
    if (await internetChecker.isConnected) {
      try {
        final response = await editProfileDataSource.uploadProfileImage(
            profileImage: profileImage);

        return Right(response);
      } catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return Left(ServerFailure(errorMessage: AppStrings.noInternet));
    }
  }
}
