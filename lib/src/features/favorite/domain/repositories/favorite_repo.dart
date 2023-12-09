import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/features/favorite/domain/entities/fav_params.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, dynamic>> getFavorites({
    required int userId,
  });

  Future<Either<Failure, dynamic>> addToFav({
    required FavParams favParams,
  });

  Future<Either<Failure, dynamic>> removeFromFav({
    required FavParams favParams,
  });
}
