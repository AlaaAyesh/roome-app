import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/roome/domain/entities/user_params.dart';
import 'package:roome/src/features/roome/domain/repositories/near_me_repo.dart';

class GetNearMeHotelsUseCase implements BaseUseCases<dynamic, UserParams> {
  final NearMeRepo nearMeRepo;

  const GetNearMeHotelsUseCase({required this.nearMeRepo});

  @override
  Future<Either<Failure, dynamic>> call(UserParams params) async {
    return await nearMeRepo.getNearMeHotels(userId: params.id!);
  }
}
