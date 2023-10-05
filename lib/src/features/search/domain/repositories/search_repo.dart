import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/hotel.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<Hotel>>> searchHotels({
    required String hotelName,
  });
}
