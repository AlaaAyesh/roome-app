import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/models/hotel.dart';
import '../../../../core/utils/app_strings.dart';
import '/src/core/network/network_info.dart';
import '/src/features/home/data/datasources/recommended/recommended_datasource.dart';
import '/src/features/home/domain/repositories/recommended_repo.dart';

class RecommendedRepoImpl implements RecommendedRepo {
  final NetworkInfo networkInfo;
  final RecommendedDataSource recommendedDataSource;

  RecommendedRepoImpl({
    required this.networkInfo,
    required this.recommendedDataSource,
  });

  @override
  Future<Either<Failure, dynamic>> getRecommendedMeHotels({
    required int userId,
  }) async {
    if (await networkInfo.isConnected) {
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
      throw const ServerException(exception: AppStrings.opps);
    }
  }
}
