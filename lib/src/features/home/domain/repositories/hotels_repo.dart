import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';

abstract class HotelsRepo {
  Future<Either<Failure, dynamic>> getHotels();
}
