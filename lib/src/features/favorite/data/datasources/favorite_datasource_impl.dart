import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/core/api/end_points.dart';
import 'package:roome/src/features/favorite/data/datasources/favorite_datasource.dart';

class FavoriteDataSourceImpl implements FavoriteDataSource {
  final ApiConsumer apiConsumer;

  const FavoriteDataSourceImpl({required this.apiConsumer});

  @override
  Future<dynamic> getFavorites({required int userId}) async {
    final response = await apiConsumer.get(
      '${EndPoints.favorite}$userId',
      queryParameters: {
        'id': userId,
      },
    );

    return response;
  }

  @override
  Future addToFav({
    required int uId,
    required int hotelId,
  }) async {
    final response = await apiConsumer.post(
      '${EndPoints.user}/add-to-fav/$uId/hotel/$hotelId',
      queryParameters: {
        'userId': uId,
        'hotelId': hotelId,
      },
    );

    return response;
  }

  @override
  Future<dynamic> removeFromFav({
    required int uId,
    required int hotelId,
  }) async {
    final response = await apiConsumer.post(
      '${EndPoints.user}/remove-from-fav/$uId/hotel/$hotelId',
      queryParameters: {
        'userId': uId,
        'hotelId': hotelId,
      },
    );

    return response;
  }
}
