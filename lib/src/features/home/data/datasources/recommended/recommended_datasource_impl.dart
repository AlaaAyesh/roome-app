import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/core/api/end_points.dart';
import 'package:roome/src/features/home/data/datasources/recommended/recommended_datasource.dart';

class RecommendedDataSourceImpl implements RecommendedDataSource {
  final ApiConsumer apiConsumer;

  const RecommendedDataSourceImpl({required this.apiConsumer});

  @override
  Future<dynamic> getRecommendedMeHotels({required int userId}) async {
    final response = await apiConsumer.get(
      '${EndPoints.recommended}$userId',
      queryParameters: {
        'id': userId,
      },
    );

    return response;
  }
}
