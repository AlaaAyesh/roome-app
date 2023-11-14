import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/home/domain/repositories/recommended_repo.dart';

class GetRecommendedHotelsUseCase implements BaseUseCases<dynamic, int> {
  final RecommendedRepo recommendedRepo;

  const GetRecommendedHotelsUseCase({required this.recommendedRepo});

  @override
  Future<Either<Failure, dynamic>> call(int? params) async {
    return await recommendedRepo.getRecommendedMeHotels(userId: params!);
  }
}
