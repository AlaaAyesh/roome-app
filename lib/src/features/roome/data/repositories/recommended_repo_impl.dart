import 'package:dartz/dartz.dart';
import 'package:roome/src/core/network/network_info.dart';
import 'package:roome/src/features/roome/data/datasources/recommended/recommended_datasource.dart';
import 'package:roome/src/features/roome/domain/repositories/recommended_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/models/hotel.dart';
import '../../../../core/utils/app_strings.dart';

class RecommendedRepoImpl extends RecommendedRepo {
  final NetworkInfo networkInfo;
  final RecommendedDataSource recommendedDataSource;

  RecommendedRepoImpl(
      {required this.networkInfo, required this.recommendedDataSource});

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
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      throw const ServerException(exception: AppStrings.opps);
    }
  }
}
