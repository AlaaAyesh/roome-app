import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/core/api/end_points.dart';
import 'package:roome/src/features/home/data/datasources/near_me/near_me_datasource.dart';

class NearMeDataSourceImpl implements NearMeDataSource {
  final ApiConsumer apiConsumer;

  const NearMeDataSourceImpl({required this.apiConsumer});

  @override
  Future<dynamic> getNearMeHotels({required int userId}) async {
    final response = await apiConsumer.get(
      '${EndPoints.nearMe}$userId',
      queryParameters: {
        'id': userId,
      },
    );

    return response;
  }
}
