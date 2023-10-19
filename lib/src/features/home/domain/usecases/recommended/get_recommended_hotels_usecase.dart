import 'package:dartz/dartz.dart';

import '/src/core/errors/failure.dart';
import '/src/core/usecases/base_usecase.dart';
import '/src/features/home/domain/repositories/recommended_repo.dart';

class GetRecommendedHotelsUseCase implements BaseUseCases<dynamic, int> {
  final RecommendedRepo recommendedRepo;

  const GetRecommendedHotelsUseCase({required this.recommendedRepo});

  @override
  Future<Either<Failure, dynamic>> call(int? params) async {
    return await recommendedRepo.getRecommendedMeHotels(userId: params!);
  }
}
