import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/roome/domain/entities/user_entity.dart';
import 'package:roome/src/features/roome/domain/repositories/room_repo.dart';

import '../../../../core/models/user_model.dart';

class GetUserDataUseCase implements BaseUseCases<UserModel, UserEntity> {
  final RoomRepo roomRepo;

  const GetUserDataUseCase({required this.roomRepo});

  @override
  Future<Either<Failure, UserModel>> call(UserEntity params) async {
    return await roomRepo.getUserData(userId: params.id!);
  }
}
