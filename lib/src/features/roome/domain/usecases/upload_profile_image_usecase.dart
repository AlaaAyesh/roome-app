import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/roome/domain/repositories/roome_repo.dart';

class UploadProfileImageUseCase implements BaseUseCases<TaskSnapshot, File> {
  final RoomeRepo roomeRepo;

  const UploadProfileImageUseCase({required this.roomeRepo});

  @override
  Future<Either<Failure, TaskSnapshot>> call(File? params) async {
    return roomeRepo.uploadProfileImage(profileImage: params);
  }
}
