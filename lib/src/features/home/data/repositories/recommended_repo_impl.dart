import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/errors/server_failure.dart';
import 'package:roome/src/core/models/user/hotel.dart';
import 'package:roome/src/core/internet/internet_checker.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/features/home/data/datasources/recommended/recommended_datasource.dart';
import 'package:roome/src/features/home/domain/repositories/recommended_repo.dart';

class RecommendedRepoImpl implements RecommendedRepo {
  final InternetChecker internetChecker;
  final RecommendedDataSource recommendedDataSource;

  const RecommendedRepoImpl({
    required this.internetChecker,
    required this.recommendedDataSource,
  });

  @override
  Future<Either<Failure, dynamic>> getRecommendedMeHotels({
    required int userId,
  }) async {
    if (await internetChecker.isConnected) {
      try {
        final response =
            await recommendedDataSource.getRecommendedMeHotels(userId: userId);

        List<Hotel> recommendedHotels = <Hotel>[];

        for (var recommendedHotel in response) {
          recommendedHotels.add(Hotel.fromJson(recommendedHotel));
        }

        return Right(recommendedHotels);
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
