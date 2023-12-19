import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:roome/service_locator.dart';
import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/core/api/dio_consumer.dart';
import 'package:roome/src/core/helpers/cache_helper.dart';
import 'package:roome/src/core/internet/internet_checker.dart';
import 'package:roome/src/core/internet/internet_checker_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetupForCore {
  void setUpForCore() {
    getIt.registerLazySingleton<InternetChecker>(
      () => InternetCheckerImpl(
        connectionChecker: getIt.get<InternetConnectionChecker>(),
      ),
    );

    getIt.registerLazySingleton<CacheHelper>(
      () => CacheHelper(getIt<SharedPreferences>()),
    );

    getIt.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(client: getIt.get<Dio>()),
    );
  }
}
