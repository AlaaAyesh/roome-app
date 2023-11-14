import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/user_model.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/roome/domain/repositories/roome_repo.dart';

class GetUserDataUseCase implements BaseUseCases<UserModel, int> {
  final RoomeRepo roomRepo;

  const GetUserDataUseCase({required this.roomRepo});

  @override
  Future<Either<Failure, UserModel>> call(int? params) async {
    return await roomRepo.getUserData(userId: params!);
  }
}
