import 'package:dartz/dartz.dart';

import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/user_model.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/auth/sign_in/domain/entities/login_parameters.dart';

import 'package:roome/src/features/auth/sign_in/domain/repositories/login_repo.dart';

class LoginUseCase implements BaseUseCases<UserModel, LoginParameters> {
  final LoginRepo loginRepo;

  const LoginUseCase({required this.loginRepo});

  @override
  Future<Either<Failure, UserModel>> call(LoginParameters parameters) {
    return loginRepo.userSignIn(
      usernameOrEmail: parameters.usernameOrEmail,
      password: parameters.password,
    );
  }
}
