import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/user/user.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/profile/domain/entities/update_user_params.dart';
import 'package:roome/src/features/profile/domain/repositories/edit_profile_repo.dart';

class UpdateUserUseCase implements BaseUseCases<UserModel, UpdateUserParams> {
  final EditProfileRepo editProfileRepo;

  const UpdateUserUseCase({required this.editProfileRepo});

  @override
  Future<Either<Failure, UserModel>> call(UpdateUserParams params) async {
    return await editProfileRepo.updateUser(
      userId: params.userId!,
      user: params,
    );
  }
}
