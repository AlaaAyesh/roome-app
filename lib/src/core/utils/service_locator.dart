import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/features/auth/sign_in/data/datasources/login_datasource.dart';
import 'package:roome/src/features/auth/sign_in/data/datasources/login_datasource_impl.dart';
import 'package:roome/src/features/auth/sign_in/data/repositories/login_repo_impl.dart';
import 'package:roome/src/features/auth/sign_in/domain/repositories/login_repo.dart';
import 'package:roome/src/features/auth/sign_in/domain/usecases/login_usecase.dart';
import 'package:roome/src/features/auth/sign_in/domain/usecases/login_with_google_usecase.dart';
import 'package:roome/src/features/auth/sign_in/presentation/cubit/login_cubit.dart';
import 'package:roome/src/features/auth/sign_up/data/datasources/sign_up_datasource.dart';
import 'package:roome/src/features/auth/sign_up/data/datasources/sign_up_datasource_impl.dart';
import 'package:roome/src/features/auth/sign_up/data/repositories/sign_up_repo_impl.dart';
import 'package:roome/src/features/auth/sign_up/domain/repositories/sign_up_repo.dart';

import 'package:roome/src/features/auth/sign_up/domain/usecases/sign_up_usecase.dart';
import 'package:roome/src/features/auth/sign_up/domain/usecases/sign_up_with_google_usecase.dart';
import 'package:roome/src/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:roome/src/features/on_boarding/data/datasources/on_boarding_datasource.dart';
import 'package:roome/src/features/on_boarding/data/repositories/on_boarding_repo_impl.dart';
import 'package:roome/src/features/on_boarding/domain/repositories/on_boarding_repo.dart';
import 'package:roome/src/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';

import '../../features/on_boarding/data/datasources/on_boarding_datasource_impl.dart';
import '../api/app_interceptors.dart';
import '../api/dio_consumer.dart';
import '../network/network_info.dart';
import '../network/network_info_impl.dart';

final GetIt serviceLocator = GetIt.instance;

void setUpServiceLocator() {
  // ==================== Cubits ====================
  setUpForCubits();

  // ==================== UseCases ====================
  setUpForUseCases();

  // ==================== Repos ====================
  setUpForRepos();

  // ==================== DataSources ====================
  setUpForDataSources();

  // ==================== Core ====================
  setUpForCore();

  // ==================== External ====================

  setUpForExternal();
}

void setUpForExternal() {
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
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
}

void setUpForCore() {
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: serviceLocator.get<InternetConnectionChecker>(),
    ),
  );

  serviceLocator.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(client: serviceLocator.get<Dio>()),
  );
}

void setUpForDataSources() {
  serviceLocator.registerLazySingleton<OnBoardingDataSource>(
    () => OnBoardingDataSourceImpl(),
  );

  serviceLocator.registerLazySingleton<LoginDataSource>(
    () => LoginDataSourceImpl(apiConsumer: serviceLocator.get<ApiConsumer>()
        // firebaseAuth: serviceLocator.get<FirebaseAuth>(),
        ),
  );

  serviceLocator.registerLazySingleton<SignUpDataSource>(
    () => SignUpDataSourceImpl(apiConsumer: serviceLocator.get<ApiConsumer>()),
  );
}

void setUpForRepos() {
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
}

void setUpForUseCases() {
  serviceLocator.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(loginRepo: serviceLocator.get<LoginRepo>()),
  );

  serviceLocator.registerLazySingleton<LoginWithGoogleUseCase>(
    () => LoginWithGoogleUseCase(loginRepo: serviceLocator.get<LoginRepo>()),
  );

  serviceLocator.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(signUpRepo: serviceLocator.get<SignUpRepo>()),
  );

  serviceLocator.registerLazySingleton<SignUpWithGoogleUseCase>(
    () => SignUpWithGoogleUseCase(signUpRepo: serviceLocator.get<SignUpRepo>()),
  );
}

void setUpForCubits() {
  serviceLocator.registerFactory<OnBoardingCubit>(() => OnBoardingCubit(
        onBoardingRepo: serviceLocator.get<OnBoardingRepo>(),
      ));

  serviceLocator.registerFactory<LoginCubit>(
    () => LoginCubit(
      loginUseCase: serviceLocator.get<LoginUseCase>(),
      loginWithGoogleUseCase: serviceLocator.get<LoginWithGoogleUseCase>(),
    ),
  );

  serviceLocator.registerFactory<SignUpCubit>(
    () => SignUpCubit(
      signUpUseCase: serviceLocator.get<SignUpUseCase>(),
      signUpWithGoogleUseCase: serviceLocator.get<SignUpWithGoogleUseCase>(),
    ),
  );
}
