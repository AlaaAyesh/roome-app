import 'package:dartz/dartz.dart';

import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/home/domain/entities/sign_out_params.dart';
import 'package:roome/src/features/roome/domain/repositories/room_repo.dart';

class SignOutUseCase implements BaseUseCases<bool, SignOutParams> {
  final RoomRepo roomRepo;

  const SignOutUseCase({required this.roomRepo});

  @override
  Future<Either<Failure, bool>> call(SignOutParams params) async {
    return await roomRepo.signOut(context: params.context);
  }
}
