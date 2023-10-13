import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class NearMeRepo {
  Future<Either<Failure, dynamic>> getNearMeHotels({required int userId});
}
