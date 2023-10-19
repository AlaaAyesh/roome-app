import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '/src/core/errors/failure.dart';
import '/src/core/usecases/base_usecase.dart';
import '/src/features/roome/domain/repositories/roome_repo.dart';

class SignOutUseCase implements BaseUseCases<bool, BuildContext> {
  final RoomeRepo roomRepo;

  const SignOutUseCase({required this.roomRepo});

  @override
  Future<Either<Failure, bool>> call(BuildContext params) async {
    return await roomRepo.signOut(context: params);
  }
}
