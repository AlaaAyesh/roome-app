import 'package:dartz/dartz.dart';

import '../../../../core/models/user_model.dart';
import '/src/core/errors/failure.dart';
import '/src/core/usecases/base_usecase.dart';
import '/src/features/roome/domain/repositories/roome_repo.dart';

class GetUserDataUseCase implements BaseUseCases<UserModel, int> {
  final RoomeRepo roomRepo;

  const GetUserDataUseCase({required this.roomRepo});

  @override
  Future<Either<Failure, UserModel>> call(int? params) async {
    return await roomRepo.getUserData(userId: params!);
  }
}
