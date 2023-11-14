import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/core/api/end_points.dart';
import 'package:roome/src/features/home/data/datasources/hotels/hotels_datasource.dart';

class HotelsDataSourceImpl implements HotelsDataSource {
  final ApiConsumer apiConsumer;

  const HotelsDataSourceImpl({required this.apiConsumer});

  @override
  Future<dynamic> getHotels() async {
    final response = await apiConsumer.get(EndPoints.hotel);

    return response;
  }
}
