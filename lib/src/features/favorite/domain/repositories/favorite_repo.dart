import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, dynamic>> getFavorites({
    required int userId,
  });

  Future<Either<Failure, dynamic>> addToFav({
    required int uId,
    required int hotelId,
  });

  Future<Either<Failure, dynamic>> removeFromFav({
    required int uId,
    required int hotelId,
  });
}
