import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class RecommendedRepo {
  Future<Either<Failure, dynamic>> getRecommendedMeHotels({
    required int userId,
  });
}
