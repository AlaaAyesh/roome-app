import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, bool>> signOut();
}
