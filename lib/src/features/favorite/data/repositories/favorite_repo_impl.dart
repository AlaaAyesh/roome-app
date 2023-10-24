import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/models/hotel.dart';
import '../../../../core/utils/app_strings.dart';
import '../datasources/favorite_datasource.dart';
import '/src/core/network/network_info.dart';
import '/src/features/favorite/domain/repositories/favorite_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final NetworkInfo networkInfo;
  final FavoriteDataSource favoriteDataSource;

  FavoriteRepoImpl({
    required this.networkInfo,
    required this.favoriteDataSource,
  });

  @override
  Future<Either<Failure, dynamic>> getFavorites({
    required int userId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await favoriteDataSource.getFavorites(userId: userId);
        List<Hotel> favorites = <Hotel>[];

        for (var fav in response) {
          favorites.add(Hotel.fromJson(fav));
        }

        return Right(favorites);
      } catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      throw const ServerException(exception: AppStrings.opps);
    }
  }

  @override
  Future<Either<Failure, dynamic>> addToFav({
    required int uId,
    required int hotelId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await favoriteDataSource.addToFav(
          uId: uId,
          hotelId: hotelId,
        );

        final message = response['message'];

        return Right(message);
      } catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      throw const ServerException(exception: AppStrings.opps);
    }
  }

  @override
  Future<Either<Failure, dynamic>> removeFromFav({
    required int uId,
    required int hotelId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await favoriteDataSource.removeFromFav(
          uId: uId,
          hotelId: hotelId,
        );

        final message = response['message'];

        return Right(message);
      } catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      throw const ServerException(exception: AppStrings.opps);
    }
  }
}
