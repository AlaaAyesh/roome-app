import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/favorite/domain/entities/user_params.dart';
import 'package:roome/src/features/roome/domain/repositories/room_repo.dart';

import '../../../../core/models/user_model.dart';



class GetUserDataUseCase implements BaseUseCases<UserModel, UserParams> {
  final RoomRepo roomRepo;

  const GetUserDataUseCase({required this.roomRepo});

  @override
  Future<Either<Failure, UserModel>> call(UserParams params) async {
    return await roomRepo.getUserData(userId: params.id!);
  }
}
