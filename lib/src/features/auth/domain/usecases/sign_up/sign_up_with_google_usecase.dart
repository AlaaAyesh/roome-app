import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/core/entities/no_params.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/auth/domain/repositories/sign_up_repo.dart';

class SignUpWithGoogleUseCase
    implements BaseUseCases<UserCredential, NoParams> {
  final SignUpRepo signUpRepo;

  const SignUpWithGoogleUseCase({required this.signUpRepo});

  @override
  Future<Either<Failure, UserCredential>> call(NoParams params) {
    return signUpRepo.signUpWithGoogle();
  }
}
