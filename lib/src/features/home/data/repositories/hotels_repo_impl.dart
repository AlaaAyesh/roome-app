import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/models/hotel.dart';
import '../../../../core/utils/app_strings.dart';
import '/src/core/network/network_info.dart';
import '/src/features/home/data/datasources/hotels/hotels_datasource.dart';
import '/src/features/home/domain/repositories/hotels_repo.dart';

class HotelsRepoImpl implements HotelsRepo {
  final NetworkInfo networkInfo;
  final HotelsDataSource hotelsDataSource;

  HotelsRepoImpl({required this.networkInfo, required this.hotelsDataSource});

  @override
  Future<Either<Failure, dynamic>> getHotels() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await hotelsDataSource.getHotels();

        List<Hotel> hotels = <Hotel>[];

        for (var hotel in response) {
          hotels.add(Hotel.fromJson(hotel));
        }

        return Right(hotels);
      } catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      throw const ServerException(exception: AppStrings.opps);
    }
  }
}
