import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/home/domain/repositories/near_me_repo.dart';

class GetNearMeHotelsUseCase implements BaseUseCases<dynamic, int> {
  final NearMeRepo nearMeRepo;

  const GetNearMeHotelsUseCase({required this.nearMeRepo});

  @override
  Future<Either<Failure, dynamic>> call(int? params) async {
    return await nearMeRepo.getNearMeHotels(userId: params!);
  }
}
