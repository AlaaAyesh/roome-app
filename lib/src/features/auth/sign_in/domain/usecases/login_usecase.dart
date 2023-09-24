import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/auth/sign_in/domain/entities/login_params.dart';
import 'package:roome/src/features/auth/sign_in/domain/repositories/login_repo.dart';

class LoginUseCase implements BaseUseCases<UserCredential, LoginParameters> {
  final LoginRepo loginRepo;

  const LoginUseCase({required this.loginRepo});

  @override
  Future<Either<Failure, UserCredential>> call(LoginParameters params) {
    return loginRepo.userSignIn(parameters: params);
  }
}
