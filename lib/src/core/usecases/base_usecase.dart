import 'package:dartz/dartz.dart';

import 'package:roome/src/core/errors/failure.dart';

abstract class BaseUseCases<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
