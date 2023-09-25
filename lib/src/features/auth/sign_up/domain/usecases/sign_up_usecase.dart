import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/core/entities/user_entity.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/auth/sign_up/domain/repositories/sign_up_repo.dart';

class SignUpUseCase implements BaseUseCases<UserCredential, UserEntity> {
  final SignUpRepo signUpRepo;

  const SignUpUseCase({required this.signUpRepo});

  @override
  Future<Either<Failure, UserCredential>> call(UserEntity user) {
    return signUpRepo.userSignUp(user: user);
  }
}
