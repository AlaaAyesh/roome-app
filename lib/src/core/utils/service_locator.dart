import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/core/api/app_interceptors.dart';
import 'package:roome/src/core/api/dio_consumer.dart';
import 'package:roome/src/core/helpers/cache_helper.dart';
import 'package:roome/src/core/network/network_info.dart';
import 'package:roome/src/core/network/network_info_impl.dart';
import 'package:roome/src/features/auth/data/datasources/login/login_datasource.dart';
import 'package:roome/src/features/auth/data/datasources/login/login_datasource_impl.dart';
import 'package:roome/src/features/auth/data/repositories/login_repo_impl.dart';
import 'package:roome/src/features/auth/domain/repositories/login_repo.dart';
import 'package:roome/src/features/auth/domain/usecases/login/user_login_usecase.dart';
import 'package:roome/src/features/auth/domain/usecases/login/login_with_google_usecase.dart';
import 'package:roome/src/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:roome/src/features/auth/data/datasources/sign_up/sign_up_datasource.dart';
import 'package:roome/src/features/auth/data/datasources/sign_up/sign_up_datasource_impl.dart';
import 'package:roome/src/features/auth/data/repositories/sign_up_repo_impl.dart';
import 'package:roome/src/features/auth/domain/repositories/sign_up_repo.dart';
import 'package:roome/src/features/auth/domain/usecases/sign_up/user_sign_up_usecase.dart';
import 'package:roome/src/features/auth/domain/usecases/sign_up/sign_up_with_google_usecase.dart';
import 'package:roome/src/features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:roome/src/features/booking/presentation/cubits/booking_one/booking_one_cubit.dart';
import 'package:roome/src/features/booking/presentation/cubits/payment/payment_cubit.dart';
import 'package:roome/src/features/favorite/data/datasources/favorite_datasource.dart';
import 'package:roome/src/features/favorite/data/datasources/favorite_datasource_impl.dart';
import 'package:roome/src/features/favorite/data/repositories/favorite_repo_impl.dart';
import 'package:roome/src/features/favorite/domain/repositories/favorite_repo.dart';
import 'package:roome/src/features/favorite/domain/usecases/add_to_fav_usecase.dart';
import 'package:roome/src/features/favorite/domain/usecases/get_favorites_usecase.dart';
import 'package:roome/src/features/favorite/domain/usecases/remove_from_fav_usecase.dart';
import 'package:roome/src/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:roome/src/features/home/data/datasources/hotels/hotels_datasource.dart';
import 'package:roome/src/features/home/data/datasources/hotels/hotels_datasource_impl.dart';
import 'package:roome/src/features/home/data/datasources/near_me/near_me_datasource.dart';
import 'package:roome/src/features/home/data/datasources/near_me/near_me_datasource_impl.dart';
import 'package:roome/src/features/home/data/datasources/recommended/recommended_datasource.dart';
import 'package:roome/src/features/home/data/datasources/recommended/recommended_datasource_impl.dart';
import 'package:roome/src/features/home/data/repositories/hotels_repo_impl.dart';
import 'package:roome/src/features/home/data/repositories/near_me_repo_impl.dart';
import 'package:roome/src/features/home/data/repositories/recommended_repo_impl.dart';
import 'package:roome/src/features/home/domain/repositories/hotels_repo.dart';
import 'package:roome/src/features/home/domain/repositories/near_me_repo.dart';
import 'package:roome/src/features/home/domain/repositories/recommended_repo.dart';
import 'package:roome/src/features/home/domain/usecases/hotels/get_hotels_usecase.dart';
import 'package:roome/src/features/home/domain/usecases/near_me/get_near_me_hotels_usecase.dart';
import 'package:roome/src/features/home/domain/usecases/recommended/get_recommended_hotels_usecase.dart';
import 'package:roome/src/features/home/presentation/cubits/hotels/hotels_cubit.dart';
import 'package:roome/src/features/home/presentation/cubits/near_me/near_me_cubit.dart';
import 'package:roome/src/features/home/presentation/cubits/recommended/recommended_cubit.dart';
import 'package:roome/src/features/notifications/data/datasources/notifications_datasource.dart';
import 'package:roome/src/features/notifications/data/datasources/notifications_datasource_impl.dart';
import 'package:roome/src/features/notifications/data/repositories/notifications_repo_impl.dart';
import 'package:roome/src/features/notifications/domain/repositories/notifications_repo.dart';
import 'package:roome/src/features/notifications/domain/usecases/add_to_notifications_usecase.dart';
import 'package:roome/src/features/notifications/domain/usecases/remove_from_notifications_usecase.dart';
import 'package:roome/src/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:roome/src/features/on_boarding/data/datasources/on_boarding_datasource.dart';
import 'package:roome/src/features/on_boarding/data/datasources/on_boarding_datasource_impl.dart';
import 'package:roome/src/features/on_boarding/data/repositories/on_boarding_repo_impl.dart';
import 'package:roome/src/features/on_boarding/domain/repositories/on_boarding_repo.dart';
import 'package:roome/src/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:roome/src/features/roome/data/datasources/roome_datasource.dart';
import 'package:roome/src/features/roome/data/datasources/roome_datasource_impl.dart';
import 'package:roome/src/features/roome/data/repositories/roome_repo_impl.dart';
import 'package:roome/src/features/roome/domain/repositories/roome_repo.dart';
import 'package:roome/src/features/roome/domain/usecases/change_bottom_nav_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/change_nav_to_home_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/get_body_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/get_bottom_nav_items_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/get_profile_image_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/get_user_data_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/sign_out_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/update_user_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/upload_profile_image_usecase.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';
import 'package:roome/src/features/search/data/datasources/search_datasource.dart';
import 'package:roome/src/features/search/data/datasources/search_datasource_impl.dart';
import 'package:roome/src/features/search/data/repositories/search_repo_impl.dart';
import 'package:roome/src/features/search/domain/repositories/search_repo.dart';
import 'package:roome/src/features/search/domain/usecases/search_hotels_usecase.dart';
import 'package:roome/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator() async {
  await _setUpForExternal();

  _setUpForCore();

  _setUpForDataSources();

  _setUpForRepos();

  _setUpForUseCases();

  _setUpForCubits();
}

Future<void> _setUpForExternal() async {
  serviceLocator.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );

  serviceLocator
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  serviceLocator.registerLazySingleton<AppInterceptors>(
    () => AppInterceptors(),
  );

  serviceLocator.registerLazySingleton<LogInterceptor>(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator
      .registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  serviceLocator.registerLazySingleton<Dio>(() => Dio());
}

void _setUpForCore() {
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: serviceLocator.get<InternetConnectionChecker>(),
    ),
  );

  serviceLocator.registerLazySingleton<CacheHelper>(
    () => CacheHelper(serviceLocator<SharedPreferences>()),
  );

  serviceLocator.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(client: serviceLocator.get<Dio>()),
  );
}

void _setUpForDataSources() {
  serviceLocator.registerLazySingleton<OnBoardingDataSource>(
    () => OnBoardingDataSourceImpl(),
  );

  serviceLocator.registerLazySingleton<LoginDataSource>(
    () => LoginDataSourceImpl(apiConsumer: serviceLocator.get<ApiConsumer>()),
  );

  serviceLocator.registerLazySingleton<SignUpDataSource>(
    () => SignUpDataSourceImpl(apiConsumer: serviceLocator.get<ApiConsumer>()),
  );

  serviceLocator.registerLazySingleton<RoomeDataSource>(
    () => RoomeDataSourceImpl(apiConsumer: serviceLocator.get<ApiConsumer>()),
  );

  serviceLocator
      .registerLazySingleton<SearchDatasource>(() => SearchDatasourceImpl(
            apiConsumer: serviceLocator.get<ApiConsumer>(),
          ));

  serviceLocator.registerLazySingleton<HotelsDataSource>(
    () => HotelsDataSourceImpl(apiConsumer: serviceLocator.get<ApiConsumer>()),
  );

  serviceLocator.registerLazySingleton<NearMeDataSource>(
    () => NearMeDataSourceImpl(apiConsumer: serviceLocator.get<ApiConsumer>()),
  );

  serviceLocator.registerLazySingleton<RecommendedDataSource>(
    () => RecommendedDataSourceImpl(
        apiConsumer: serviceLocator.get<ApiConsumer>()),
  );

  serviceLocator.registerLazySingleton<FavoriteDataSource>(
    () => FavoriteDataSourceImpl(
      apiConsumer: serviceLocator.get<ApiConsumer>(),
    ),
  );

  serviceLocator.registerLazySingleton<NotificationsDataSource>(
    () => NotificationsDataSourceImpl(),
  );
}

void _setUpForRepos() {
  serviceLocator.registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl(
        onBoardingDataSource: serviceLocator.get<OnBoardingDataSource>(),
      ));

  serviceLocator.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(
      loginDataSource: serviceLocator.get<LoginDataSource>(),
      networkInfo: serviceLocator.get<NetworkInfo>(),
    ),
  );

  serviceLocator.registerLazySingleton<SignUpRepo>(
    () => SignUpRepoImpl(
      networkInfo: serviceLocator.get<NetworkInfo>(),
      signUpDataSource: serviceLocator.get<SignUpDataSource>(),
    ),
  );

  serviceLocator.registerLazySingleton<RoomeRepo>(
    () => RoomeRepoImpl(
      roomeDataSource: serviceLocator.get<RoomeDataSource>(),
      networkInfo: serviceLocator.get<NetworkInfo>(),
    ),
  );

  serviceLocator.registerLazySingleton<SearchRepo>(() => SearchRepoImpl(
        networkInfo: serviceLocator.get<NetworkInfo>(),
        searchDatasource: serviceLocator.get<SearchDatasource>(),
      ));

  serviceLocator.registerLazySingleton<HotelsRepo>(() => HotelsRepoImpl(
        networkInfo: serviceLocator.get<NetworkInfo>(),
        hotelsDataSource: serviceLocator.get<HotelsDataSource>(),
      ));

  serviceLocator.registerLazySingleton<NearMeRepo>(
    () => NearMeRepoImpl(
        networkInfo: serviceLocator.get<NetworkInfo>(),
        nearMeDataSource: serviceLocator.get<NearMeDataSource>()),
  );

  serviceLocator.registerLazySingleton<RecommendedRepo>(
    () => RecommendedRepoImpl(
        networkInfo: serviceLocator.get<NetworkInfo>(),
        recommendedDataSource: serviceLocator.get<RecommendedDataSource>()),
  );

  serviceLocator.registerLazySingleton<FavoriteRepo>(
    () => FavoriteRepoImpl(
      networkInfo: serviceLocator.get<NetworkInfo>(),
      favoriteDataSource: serviceLocator.get<FavoriteDataSource>(),
    ),
  );

  serviceLocator.registerLazySingleton<NotificationsRepo>(
    () => NotificationsRepoImpl(
        notificationsDataSource: serviceLocator.get<NotificationsDataSource>()),
  );
}

void _setUpForUseCases() {
  serviceLocator.registerLazySingleton<UserLoginUseCase>(
    () => UserLoginUseCase(loginRepo: serviceLocator.get<LoginRepo>()),
  );

  serviceLocator.registerLazySingleton<LoginWithGoogleUseCase>(
    () => LoginWithGoogleUseCase(loginRepo: serviceLocator.get<LoginRepo>()),
  );

  serviceLocator.registerLazySingleton<UserSignUpUseCase>(
    () => UserSignUpUseCase(signUpRepo: serviceLocator.get<SignUpRepo>()),
  );

  serviceLocator.registerLazySingleton<SignUpWithGoogleUseCase>(
    () => SignUpWithGoogleUseCase(signUpRepo: serviceLocator.get<SignUpRepo>()),
  );

  serviceLocator.registerLazySingleton<ChangeBottomNavUseCase>(
    () => ChangeBottomNavUseCase(roomRepo: serviceLocator.get<RoomeRepo>()),
  );

  serviceLocator.registerLazySingleton<ChangeBottomNavToHomeUseCase>(
    () => ChangeBottomNavToHomeUseCase(
      roomRepo: serviceLocator.get<RoomeRepo>(),
    ),
  );

  serviceLocator.registerLazySingleton<GetBodyUseCse>(
    () => GetBodyUseCse(roomRepo: serviceLocator.get<RoomeRepo>()),
  );

  serviceLocator.registerLazySingleton<GetBottomNavItemsUseCase>(
    () => GetBottomNavItemsUseCase(roomRepo: serviceLocator.get<RoomeRepo>()),
  );

  serviceLocator.registerLazySingleton<GetUserDataUseCase>(
    () => GetUserDataUseCase(roomRepo: serviceLocator.get<RoomeRepo>()),
  );

  serviceLocator.registerLazySingleton<SignOutUseCase>(
    () => SignOutUseCase(roomRepo: serviceLocator.get<RoomeRepo>()),
  );

  serviceLocator.registerLazySingleton<GetFavoritesUseCase>(
    () => GetFavoritesUseCase(favoriteRepo: serviceLocator.get<FavoriteRepo>()),
  );

  serviceLocator.registerLazySingleton<SearchHotelsUseCase>(
    () => SearchHotelsUseCase(
      searchRepo: serviceLocator.get<SearchRepo>(),
    ),
  );

  serviceLocator.registerLazySingleton<AddToFavUseCase>(
    () => AddToFavUseCase(favoriteRepo: serviceLocator.get<FavoriteRepo>()),
  );

  serviceLocator.registerLazySingleton<RemoveFromFavUseCase>(
    () =>
        RemoveFromFavUseCase(favoriteRepo: serviceLocator.get<FavoriteRepo>()),
  );

  serviceLocator.registerLazySingleton<GetHotelsUseCase>(
    () => GetHotelsUseCase(hotelsRepo: serviceLocator.get<HotelsRepo>()),
  );

  serviceLocator.registerLazySingleton<GetNearMeHotelsUseCase>(
    () => GetNearMeHotelsUseCase(nearMeRepo: serviceLocator.get<NearMeRepo>()),
  );

  serviceLocator.registerLazySingleton<GetRecommendedHotelsUseCase>(
    () => GetRecommendedHotelsUseCase(
      recommendedRepo: serviceLocator.get<RecommendedRepo>(),
    ),
  );

  serviceLocator.registerLazySingleton<AddToNotificationsUseCase>(
    () => AddToNotificationsUseCase(
        notificationsRepo: serviceLocator.get<NotificationsRepo>()),
  );
  serviceLocator.registerLazySingleton<RemoveFromNotificationsUseCase>(
    () => RemoveFromNotificationsUseCase(
        notificationsRepo: serviceLocator.get<NotificationsRepo>()),
  );

  serviceLocator.registerLazySingleton<UpdateUserUseCase>(
    () => UpdateUserUseCase(roomRepo: serviceLocator.get<RoomeRepo>()),
  );

  serviceLocator.registerLazySingleton<GetProfileImageUseCase>(
    () => GetProfileImageUseCase(roomeRepo: serviceLocator.get<RoomeRepo>()),
  );

  serviceLocator.registerLazySingleton<UploadProfileImageUseCase>(
    () => UploadProfileImageUseCase(roomeRepo: serviceLocator.get<RoomeRepo>()),
  );
}

void _setUpForCubits() {
  serviceLocator.registerFactory<OnBoardingCubit>(() => OnBoardingCubit(
        onBoardingRepo: serviceLocator.get<OnBoardingRepo>(),
      ));

  serviceLocator.registerFactory<LoginCubit>(
    () => LoginCubit(
      loginUseCase: serviceLocator.get<UserLoginUseCase>(),
      loginWithGoogleUseCase: serviceLocator.get<LoginWithGoogleUseCase>(),
    ),
  );

  serviceLocator.registerFactory<SignUpCubit>(
    () => SignUpCubit(
      signUpUseCase: serviceLocator.get<UserSignUpUseCase>(),
      signUpWithGoogleUseCase: serviceLocator.get<SignUpWithGoogleUseCase>(),
    ),
  );

  serviceLocator.registerFactory<RoomeCubit>(
    () => RoomeCubit(
      changeBottomNavUseCase: serviceLocator.get<ChangeBottomNavUseCase>(),
      changeBottomNavToHomeUseCase:
          serviceLocator.get<ChangeBottomNavToHomeUseCase>(),
      getBodyUseCse: serviceLocator.get<GetBodyUseCse>(),
      getBottomNavItemsUseCase: serviceLocator.get<GetBottomNavItemsUseCase>(),
      getUserDataUseCase: serviceLocator.get<GetUserDataUseCase>(),
      updateUserUseCase: serviceLocator.get<UpdateUserUseCase>(),
      getProfileImageUseCase: serviceLocator.get<GetProfileImageUseCase>(),
      uploadProfileImageUseCase:
          serviceLocator.get<UploadProfileImageUseCase>(),
      signOutUseCase: serviceLocator.get<SignOutUseCase>(),
    ),
  );

  serviceLocator.registerFactory<SearchCubit>(() => SearchCubit(
        searchHotelsUseCase: serviceLocator.get<SearchHotelsUseCase>(),
      ));

  serviceLocator.registerFactory<HotelsCubit>(
    () => HotelsCubit(getHotelsUseCase: serviceLocator.get<GetHotelsUseCase>()),
  );

  serviceLocator.registerFactory<NearMeCubit>(
    () => NearMeCubit(
        getNearMeHotelsUseCase: serviceLocator.get<GetNearMeHotelsUseCase>()),
  );

  serviceLocator.registerFactory<RecommendedCubit>(
    () => RecommendedCubit(
      getRecommendedHotelsUseCase:
          serviceLocator.get<GetRecommendedHotelsUseCase>(),
    ),
  );

  serviceLocator.registerFactory<FavoriteCubit>(
    () => FavoriteCubit(
      getFavoritesUseCase: serviceLocator.get<GetFavoritesUseCase>(),
      addToFavUseCase: serviceLocator.get<AddToFavUseCase>(),
      removeFromFavUseCase: serviceLocator.get<RemoveFromFavUseCase>(),
    ),
  );

  serviceLocator.registerFactory<BookingOneCubit>(() => BookingOneCubit());

  serviceLocator.registerFactory<ThemesCubit>(() => ThemesCubit());

  serviceLocator.registerFactory<NotificationsCubit>(
    () => NotificationsCubit(
      addToNotificationsUseCase:
          serviceLocator.get<AddToNotificationsUseCase>(),
      removeFromNotificationsUseCase:
          serviceLocator.get<RemoveFromNotificationsUseCase>(),
    ),
  );

  serviceLocator.registerFactory<PaymentCubit>(() => PaymentCubit());
}
