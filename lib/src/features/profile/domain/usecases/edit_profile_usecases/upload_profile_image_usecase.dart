import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/profile/domain/repositories/edit_profile_repo.dart';

class UploadProfileImageUseCase implements BaseUseCases<TaskSnapshot, File> {
  final EditProfileRepo editProfileRepo;

  const UploadProfileImageUseCase({required this.editProfileRepo});

  @override
  Future<Either<Failure, TaskSnapshot>> call(File? params) async {
    return await editProfileRepo.uploadProfileImage(profileImage: params);
  }
}
