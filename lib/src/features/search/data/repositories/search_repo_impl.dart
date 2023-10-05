import 'package:dartz/dartz.dart';
import 'package:roome/src/core/network/network_info.dart';
import 'package:roome/src/features/search/data/datasources/search_datasource.dart';
import 'package:roome/src/features/search/domain/repositories/search_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/models/hotel.dart';
import '../../../../core/utils/app_strings.dart';

class SearchRepoImpl extends SearchRepo {
  final NetworkInfo networkInfo;
  final SearchDatasource searchDatasource;

  SearchRepoImpl({
    required this.networkInfo,
    required this.searchDatasource,
  });

  @override
  Future<Either<Failure, List<Hotel>>> searchHotels({
    required String hotelName,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await searchDatasource.searchHotels(hotelName: hotelName);

        List<Hotel> hotels = <Hotel>[];

        for (Map<String, dynamic> hotel in response) {
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
