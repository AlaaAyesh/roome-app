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
import 'package:roome/src/features/on_boarding/domain/usecases/get_onboarding_pages_usecase.dart';
import 'package:roome/src/features/on_boarding/domain/usecases/navigate_between_pages_usecase.dart';
import 'package:roome/src/features/on_boarding/domain/usecases/previous_page_usecase.dart';
import 'package:roome/src/features/on_boarding/domain/usecases/skip_to_login_usecase.dart';
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

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  Future<void> setUpServiceLocator() async {
    await _setUpForExternal();

    _setUpForCore();

    _setUpForDataSources();

    _setUpForRepos();

    _setUpForUseCases();

    _setUpForCubits();
  }

  Future<void> _setUpForExternal() async {
    getIt.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker(),
    );

    getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

    getIt.registerLazySingleton<AppInterceptors>(
      () => AppInterceptors(),
    );

    getIt.registerLazySingleton<LogInterceptor>(
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
    getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    getIt.registerLazySingleton<Dio>(() => Dio());
  }

  void _setUpForCore() {
    getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(
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

  void _setUpForDataSources() {
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
  }

  void _setUpForRepos() {
    getIt.registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl(
          onBoardingDataSource: getIt.get<OnBoardingDataSource>(),
        ));

    getIt.registerLazySingleton<LoginRepo>(
      () => LoginRepoImpl(
        loginDataSource: getIt.get<LoginDataSource>(),
        networkInfo: getIt.get<NetworkInfo>(),
      ),
    );

    getIt.registerLazySingleton<SignUpRepo>(
      () => SignUpRepoImpl(
        networkInfo: getIt.get<NetworkInfo>(),
        signUpDataSource: getIt.get<SignUpDataSource>(),
      ),
    );

    getIt.registerLazySingleton<RoomeRepo>(
      () => RoomeRepoImpl(
        roomeDataSource: getIt.get<RoomeDataSource>(),
        networkInfo: getIt.get<NetworkInfo>(),
      ),
    );

    getIt.registerLazySingleton<SearchRepo>(() => SearchRepoImpl(
          networkInfo: getIt.get<NetworkInfo>(),
          searchDatasource: getIt.get<SearchDatasource>(),
        ));

    getIt.registerLazySingleton<HotelsRepo>(() => HotelsRepoImpl(
          networkInfo: getIt.get<NetworkInfo>(),
          hotelsDataSource: getIt.get<HotelsDataSource>(),
        ));

    getIt.registerLazySingleton<NearMeRepo>(
      () => NearMeRepoImpl(
          networkInfo: getIt.get<NetworkInfo>(),
          nearMeDataSource: getIt.get<NearMeDataSource>()),
    );

    getIt.registerLazySingleton<RecommendedRepo>(
      () => RecommendedRepoImpl(
          networkInfo: getIt.get<NetworkInfo>(),
          recommendedDataSource: getIt.get<RecommendedDataSource>()),
    );

    getIt.registerLazySingleton<FavoriteRepo>(
      () => FavoriteRepoImpl(
        networkInfo: getIt.get<NetworkInfo>(),
        favoriteDataSource: getIt.get<FavoriteDataSource>(),
      ),
    );

    getIt.registerLazySingleton<NotificationsRepo>(
      () => NotificationsRepoImpl(
          notificationsDataSource: getIt.get<NotificationsDataSource>()),
    );
  }

  void _setUpForUseCases() {
    getIt.registerLazySingleton<UserLoginUseCase>(
      () => UserLoginUseCase(loginRepo: getIt.get<LoginRepo>()),
    );

    getIt.registerLazySingleton<LoginWithGoogleUseCase>(
      () => LoginWithGoogleUseCase(loginRepo: getIt.get<LoginRepo>()),
    );

    getIt.registerLazySingleton<UserSignUpUseCase>(
      () => UserSignUpUseCase(signUpRepo: getIt.get<SignUpRepo>()),
    );

    getIt.registerLazySingleton<SignUpWithGoogleUseCase>(
      () => SignUpWithGoogleUseCase(signUpRepo: getIt.get<SignUpRepo>()),
    );

    getIt.registerLazySingleton<ChangeBottomNavUseCase>(
      () => ChangeBottomNavUseCase(roomRepo: getIt.get<RoomeRepo>()),
    );

    getIt.registerLazySingleton<ChangeBottomNavToHomeUseCase>(
      () => ChangeBottomNavToHomeUseCase(
        roomRepo: getIt.get<RoomeRepo>(),
      ),
    );

    getIt.registerLazySingleton<GetBodyUseCse>(
      () => GetBodyUseCse(roomRepo: getIt.get<RoomeRepo>()),
    );

    getIt.registerLazySingleton<GetBottomNavItemsUseCase>(
      () => GetBottomNavItemsUseCase(roomRepo: getIt.get<RoomeRepo>()),
    );

    getIt.registerLazySingleton<GetUserDataUseCase>(
      () => GetUserDataUseCase(roomRepo: getIt.get<RoomeRepo>()),
    );

    getIt.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(roomRepo: getIt.get<RoomeRepo>()),
    );

    getIt.registerLazySingleton<GetFavoritesUseCase>(
      () => GetFavoritesUseCase(favoriteRepo: getIt.get<FavoriteRepo>()),
    );

    getIt.registerLazySingleton<SearchHotelsUseCase>(
      () => SearchHotelsUseCase(
        searchRepo: getIt.get<SearchRepo>(),
      ),
    );

    getIt.registerLazySingleton<AddToFavUseCase>(
      () => AddToFavUseCase(favoriteRepo: getIt.get<FavoriteRepo>()),
    );

    getIt.registerLazySingleton<RemoveFromFavUseCase>(
      () => RemoveFromFavUseCase(favoriteRepo: getIt.get<FavoriteRepo>()),
    );

    getIt.registerLazySingleton<GetHotelsUseCase>(
      () => GetHotelsUseCase(hotelsRepo: getIt.get<HotelsRepo>()),
    );

    getIt.registerLazySingleton<GetNearMeHotelsUseCase>(
      () => GetNearMeHotelsUseCase(nearMeRepo: getIt.get<NearMeRepo>()),
    );

    getIt.registerLazySingleton<GetRecommendedHotelsUseCase>(
      () => GetRecommendedHotelsUseCase(
        recommendedRepo: getIt.get<RecommendedRepo>(),
      ),
    );

    getIt.registerLazySingleton<AddToNotificationsUseCase>(
      () => AddToNotificationsUseCase(
          notificationsRepo: getIt.get<NotificationsRepo>()),
    );
    getIt.registerLazySingleton<RemoveFromNotificationsUseCase>(
      () => RemoveFromNotificationsUseCase(
          notificationsRepo: getIt.get<NotificationsRepo>()),
    );

    getIt.registerLazySingleton<UpdateUserUseCase>(
      () => UpdateUserUseCase(roomRepo: getIt.get<RoomeRepo>()),
    );

    getIt.registerLazySingleton<GetProfileImageUseCase>(
      () => GetProfileImageUseCase(roomeRepo: getIt.get<RoomeRepo>()),
    );

    getIt.registerLazySingleton<UploadProfileImageUseCase>(
      () => UploadProfileImageUseCase(roomeRepo: getIt.get<RoomeRepo>()),
    );

    getIt.registerLazySingleton<GetOnboardingPagesUseCase>(
      () => GetOnboardingPagesUseCase(
        onBoardingRepo: getIt.get<OnBoardingRepo>(),
      ),
    );

    getIt.registerLazySingleton<NavigateBetweenPagesUseCase>(
      () => NavigateBetweenPagesUseCase(
        onBoardingRepo: getIt.get<OnBoardingRepo>(),
      ),
    );

    getIt.registerLazySingleton<SkipToLoginUseCase>(
      () => SkipToLoginUseCase(
        onBoardingRepo: getIt.get<OnBoardingRepo>(),
      ),
    );

    getIt.registerLazySingleton<PreviousPageUseCase>(
      () => PreviousPageUseCase(onBoardingRepo: getIt.get<OnBoardingRepo>()),
    );
  }

  void _setUpForCubits() {
    getIt.registerFactory<OnBoardingCubit>(
      () => OnBoardingCubit(
        getPagesUseCase: getIt.get<GetOnboardingPagesUseCase>(),
        navigateBetweenPagesUseCase: getIt.get<NavigateBetweenPagesUseCase>(),
        skipToLoginUseCase: getIt.get<SkipToLoginUseCase>(),
        previousPageUseCase: getIt.get<PreviousPageUseCase>(),
      ),
    );

    getIt.registerFactory<LoginCubit>(
      () => LoginCubit(
        loginUseCase: getIt.get<UserLoginUseCase>(),
        loginWithGoogleUseCase: getIt.get<LoginWithGoogleUseCase>(),
      ),
    );

    getIt.registerFactory<SignUpCubit>(
      () => SignUpCubit(
        signUpUseCase: getIt.get<UserSignUpUseCase>(),
        signUpWithGoogleUseCase: getIt.get<SignUpWithGoogleUseCase>(),
      ),
    );

    getIt.registerFactory<RoomeCubit>(
      () => RoomeCubit(
        changeBottomNavUseCase: getIt.get<ChangeBottomNavUseCase>(),
        changeBottomNavToHomeUseCase: getIt.get<ChangeBottomNavToHomeUseCase>(),
        getBodyUseCse: getIt.get<GetBodyUseCse>(),
        getBottomNavItemsUseCase: getIt.get<GetBottomNavItemsUseCase>(),
        getUserDataUseCase: getIt.get<GetUserDataUseCase>(),
        updateUserUseCase: getIt.get<UpdateUserUseCase>(),
        getProfileImageUseCase: getIt.get<GetProfileImageUseCase>(),
        uploadProfileImageUseCase: getIt.get<UploadProfileImageUseCase>(),
        signOutUseCase: getIt.get<SignOutUseCase>(),
      ),
    );

    getIt.registerFactory<SearchCubit>(() => SearchCubit(
          searchHotelsUseCase: getIt.get<SearchHotelsUseCase>(),
        ));

    getIt.registerFactory<HotelsCubit>(
      () => HotelsCubit(getHotelsUseCase: getIt.get<GetHotelsUseCase>()),
    );

    getIt.registerFactory<NearMeCubit>(
      () => NearMeCubit(
          getNearMeHotelsUseCase: getIt.get<GetNearMeHotelsUseCase>()),
    );

    getIt.registerFactory<RecommendedCubit>(
      () => RecommendedCubit(
        getRecommendedHotelsUseCase: getIt.get<GetRecommendedHotelsUseCase>(),
      ),
    );

    getIt.registerFactory<FavoriteCubit>(
      () => FavoriteCubit(
        getFavoritesUseCase: getIt.get<GetFavoritesUseCase>(),
        addToFavUseCase: getIt.get<AddToFavUseCase>(),
        removeFromFavUseCase: getIt.get<RemoveFromFavUseCase>(),
      ),
    );

    getIt.registerFactory<BookingOneCubit>(() => BookingOneCubit());

    getIt.registerFactory<ThemesCubit>(() => ThemesCubit());

    getIt.registerFactory<NotificationsCubit>(
      () => NotificationsCubit(
        addToNotificationsUseCase: getIt.get<AddToNotificationsUseCase>(),
        removeFromNotificationsUseCase:
            getIt.get<RemoveFromNotificationsUseCase>(),
      ),
    );

    getIt.registerFactory<PaymentCubit>(() => PaymentCubit());
  }
}
