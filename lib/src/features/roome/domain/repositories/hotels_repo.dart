import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class HotelsRepo {
  Future<Either<Failure, dynamic>> getHotels();
}
