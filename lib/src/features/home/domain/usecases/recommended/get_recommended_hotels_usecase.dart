import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/favorite/domain/entities/user_params.dart';
import 'package:roome/src/features/home/domain/repositories/recommended_repo.dart';

class GetRecommendedHotelsUseCase implements BaseUseCases<dynamic, UserParams> {
  final RecommendedRepo recommendedRepo;

  const GetRecommendedHotelsUseCase({required this.recommendedRepo});

  @override
  Future<Either<Failure, dynamic>> call(UserParams params) async {
    return await recommendedRepo.getRecommendedMeHotels(userId: params.id!);
  }
}
