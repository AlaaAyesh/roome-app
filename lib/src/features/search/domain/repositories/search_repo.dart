import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/hotel.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<Hotel>>> searchHotels({
    required String hotelName,
  });
}
