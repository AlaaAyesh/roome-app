import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/user_model.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/roome/domain/entities/update_user_params.dart';
import 'package:roome/src/features/roome/domain/repositories/roome_repo.dart';

class UpdateUserUseCase implements BaseUseCases<UserModel, UpdateUserParams> {
  final RoomeRepo roomRepo;

  const UpdateUserUseCase({required this.roomRepo});

  @override
  Future<Either<Failure, UserModel>> call(UpdateUserParams params) async {
    return await roomRepo.updateUser(
      userId: params.userId!,
      user: params,
    );
  }
}
