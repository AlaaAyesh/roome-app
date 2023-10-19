import 'package:dartz/dartz.dart';

import '/src/core/errors/failure.dart';
import '/src/core/models/user_model.dart';
import '/src/core/usecases/base_usecase.dart';
import '/src/features/auth/sign_in/domain/entities/login_parameters.dart';
import '/src/features/auth/sign_in/domain/repositories/login_repo.dart';

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
