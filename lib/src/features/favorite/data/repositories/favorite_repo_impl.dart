import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/errors/server_failure.dart';
import 'package:roome/src/core/models/user/hotel.dart';
import 'package:roome/src/core/internet/internet_checker.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/features/favorite/data/datasources/favorite_datasource.dart';
import 'package:roome/src/features/favorite/domain/entities/fav_params.dart';
import 'package:roome/src/features/favorite/domain/repositories/favorite_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final InternetChecker internetChecker;
  final FavoriteDataSource favoriteDataSource;

  const FavoriteRepoImpl({
    required this.internetChecker,
    required this.favoriteDataSource,
  });

  @override
  Future<Either<Failure, dynamic>> getFavorites({
    required int userId,
  }) async {
    if (await internetChecker.isConnected) {
      try {
        final response = await favoriteDataSource.getFavorites(userId: userId);
        List<Hotel> favorites = <Hotel>[];

        for (var fav in response) {
          favorites.add(Hotel.fromJson(fav));
        }

        return Right(favorites);
      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure.fromDioException(e));
        }
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return Left(ServerFailure(errorMessage: AppStrings.noInternet));
    }
  }

  @override
  Future<Either<Failure, dynamic>> addToFav({
    required FavParams favParams,
  }) async {
    if (await internetChecker.isConnected) {
      try {
        final response =
            await favoriteDataSource.addToFav(favParams: favParams);

        final message = response['message'];

        return Right(message);
      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure.fromDioException(e));
        }
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return Left(ServerFailure(errorMessage: AppStrings.noInternet));
    }
  }

  @override
  Future<Either<Failure, dynamic>> removeFromFav({
    required FavParams favParams,
  }) async {
    if (await internetChecker.isConnected) {
      try {
        final response =
            await favoriteDataSource.removeFromFav(favParams: favParams);

        final message = response['message'];

        return Right(message);
      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure.fromDioException(e));
        }
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return Left(ServerFailure(errorMessage: AppStrings.noInternet));
    }
  }
}
