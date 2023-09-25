import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/core/entities/user_entity.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';

import 'package:roome/src/features/auth/sign_in/domain/repositories/login_repo.dart';

class LoginUseCase implements BaseUseCases<UserCredential, UserEntity> {
  final LoginRepo loginRepo;

  const LoginUseCase({required this.loginRepo});

  @override
  Future<Either<Failure, UserCredential>> call(UserEntity user) {
    return loginRepo.userSignIn(user: user);
  }
}
