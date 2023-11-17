import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/user_model.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/auth/domain/entities/sign_up/sign_up_parameters.dart';
import 'package:roome/src/features/auth/domain/repositories/sign_up_repo.dart';

class UserSignUpUseCase implements BaseUseCases<UserModel, SignUpParameters> {
  final SignUpRepo signUpRepo;

  const UserSignUpUseCase({required this.signUpRepo});

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
