import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';

abstract class RecommendedRepo {
  Future<Either<Failure, dynamic>> getRecommendedMeHotels({
    required int userId,
  });
}
