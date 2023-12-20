import 'package:roome/service_locator.dart';
import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/features/auth/data/datasources/login/login_datasource.dart';
import 'package:roome/src/features/auth/data/datasources/login/login_datasource_impl.dart';
import 'package:roome/src/features/auth/data/datasources/sign_up/sign_up_datasource.dart';
import 'package:roome/src/features/auth/data/datasources/sign_up/sign_up_datasource_impl.dart';
import 'package:roome/src/features/favorite/data/datasources/favorite_datasource.dart';
import 'package:roome/src/features/favorite/data/datasources/favorite_datasource_impl.dart';
import 'package:roome/src/features/home/data/datasources/hotels/hotels_datasource.dart';
import 'package:roome/src/features/home/data/datasources/hotels/hotels_datasource_impl.dart';
import 'package:roome/src/features/home/data/datasources/near_me/near_me_datasource.dart';
import 'package:roome/src/features/home/data/datasources/near_me/near_me_datasource_impl.dart';
import 'package:roome/src/features/home/data/datasources/recommended/recommended_datasource.dart';
import 'package:roome/src/features/home/data/datasources/recommended/recommended_datasource_impl.dart';
import 'package:roome/src/features/notifications/data/datasources/notifications_datasource.dart';
import 'package:roome/src/features/notifications/data/datasources/notifications_datasource_impl.dart';
import 'package:roome/src/features/onboarding/data/datasources/on_boarding_datasource.dart';
import 'package:roome/src/features/onboarding/data/datasources/on_boarding_datasource_impl.dart';
import 'package:roome/src/features/profile/data/datasources/edit_profile/edit_profile_datasource.dart';
import 'package:roome/src/features/profile/data/datasources/edit_profile/edit_profile_datasource_impl.dart';
import 'package:roome/src/features/profile/data/datasources/profile/profile_datasource.dart';
import 'package:roome/src/features/profile/data/datasources/profile/profile_datasource_impl.dart';
import 'package:roome/src/features/roome/data/datasources/roome_datasource.dart';
import 'package:roome/src/features/roome/data/datasources/roome_datasource_impl.dart';
import 'package:roome/src/features/search/data/datasources/search_datasource.dart';
import 'package:roome/src/features/search/data/datasources/search_datasource_impl.dart';

class SetupForDataSources {
  void setUpForDataSources() {
    getIt.registerLazySingleton<OnBoardingDataSource>(
      () => OnBoardingDataSourceImpl(),
    );

    getIt.registerLazySingleton<LoginDataSource>(
      () => LoginDataSourceImpl(apiConsumer: getIt.get<ApiConsumer>()),
    );

    getIt.registerLazySingleton<SignUpDataSource>(
      () => SignUpDataSourceImpl(apiConsumer: getIt.get<ApiConsumer>()),
    );

    getIt.registerLazySingleton<RoomeDataSource>(
      () => RoomeDataSourceImpl(apiConsumer: getIt.get<ApiConsumer>()),
    );

    getIt.registerLazySingleton<SearchDatasource>(() => SearchDatasourceImpl(
          apiConsumer: getIt.get<ApiConsumer>(),
        ));

    getIt.registerLazySingleton<HotelsDataSource>(
      () => HotelsDataSourceImpl(apiConsumer: getIt.get<ApiConsumer>()),
    );

    getIt.registerLazySingleton<NearMeDataSource>(
      () => NearMeDataSourceImpl(apiConsumer: getIt.get<ApiConsumer>()),
    );

    getIt.registerLazySingleton<RecommendedDataSource>(
      () => RecommendedDataSourceImpl(apiConsumer: getIt.get<ApiConsumer>()),
    );

    getIt.registerLazySingleton<FavoriteDataSource>(
      () => FavoriteDataSourceImpl(
        apiConsumer: getIt.get<ApiConsumer>(),
      ),
    );

    getIt.registerLazySingleton<NotificationsDataSource>(
      () => NotificationsDataSourceImpl(),
    );

    getIt.registerLazySingleton<ProfileDataSource>(
      () => ProfileDataSourceImpl(),
    );

    getIt.registerLazySingleton<EditProfileDataSource>(
      () => EditProfileDataSourceImpl(apiConsumer: getIt.get<ApiConsumer>()),
    );
  }
}
