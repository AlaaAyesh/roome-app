import 'package:dartz/dartz.dart';
import 'package:roome/src/core/entities/no_params.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/profile/domain/repositories/profile_repo.dart';

class SignOutUseCase implements BaseUseCases<bool, NoParams> {
  final ProfileRepo profileRepo;

  const SignOutUseCase({required this.profileRepo});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await profileRepo.signOut();
  }
}
