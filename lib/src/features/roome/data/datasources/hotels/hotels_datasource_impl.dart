import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/features/roome/data/datasources/hotels/hotels_datasource.dart';

import '../../../../../core/api/end_points.dart';

class HotelsDataSourceImpl implements HotelsDataSource {
  final ApiConsumer apiConsumer;

  const HotelsDataSourceImpl({required this.apiConsumer});

  @override
  Future<dynamic> getHotels() async {
    final response = await apiConsumer.get(EndPoints.hotel);

    return response;
  }
}
