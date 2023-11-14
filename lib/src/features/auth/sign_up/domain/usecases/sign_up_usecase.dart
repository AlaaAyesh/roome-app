import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/user_model.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/auth/sign_up/domain/entities/sign_up_parameters.dart';
import 'package:roome/src/features/auth/sign_up/domain/repositories/sign_up_repo.dart';

class SignUpUseCase implements BaseUseCases<UserModel, SignUpParameters> {
  final SignUpRepo signUpRepo;

  const SignUpUseCase({required this.signUpRepo});

  @override
  Future<Either<Failure, UserModel>> call(SignUpParameters params) {
    return signUpRepo.userSignUp(
      firstName: params.firstName,
      lastName: params.lastName,
      username: params.username,
      email: params.email,
      password: params.password,
    );
  }
}
