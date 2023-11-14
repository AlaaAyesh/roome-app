import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';

abstract class NearMeRepo {
  Future<Either<Failure, dynamic>> getNearMeHotels({required int userId});
}
