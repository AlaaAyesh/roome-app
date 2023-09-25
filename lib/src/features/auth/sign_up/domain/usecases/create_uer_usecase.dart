import 'package:dartz/dartz.dart';
import 'package:roome/src/core/entities/user_entity.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/auth/sign_up/domain/repositories/sign_up_repo.dart';

class CreateUserUseCase implements BaseUseCases<void, UserEntity> {
  final SignUpRepo signUpRepo;

  const CreateUserUseCase({required this.signUpRepo});

  @override
  Future<Either<Failure, void>> call(UserEntity user) {
    return signUpRepo.firestoreCreateUSer(user: user);
  }
}
