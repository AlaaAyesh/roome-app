import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:roome/src/features/auth/sign_in/data/datasources/login_datasource.dart';
import 'package:roome/src/features/auth/sign_in/data/datasources/login_datasource_impl.dart';
import 'package:roome/src/features/auth/sign_in/data/repositories/login_repo_impl.dart';
import 'package:roome/src/features/auth/sign_in/domain/repositories/login_repo.dart';
import 'package:roome/src/features/auth/sign_in/domain/usecases/login_usecase.dart';
import 'package:roome/src/features/auth/sign_in/domain/usecases/login_with_google_usecase.dart';
import 'package:roome/src/features/auth/sign_in/presentation/cubit/login_cubit.dart';
import 'package:roome/src/features/on_boarding/data/datasources/on_boarding_datasource.dart';
import 'package:roome/src/features/on_boarding/data/repositories/on_boarding_repo_impl.dart';
import 'package:roome/src/features/on_boarding/domain/repositories/on_boarding_repo.dart';
import 'package:roome/src/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';

import '../../features/on_boarding/data/datasources/on_boarding_datasource_impl.dart';
import '../network/network_info.dart';
import '../network/network_info_impl.dart';

final GetIt serviceLocator = GetIt.instance;

void setUpServiceLocator() {
  // ==================== Cubits ====================
  serviceLocator.registerFactory<OnBoardingCubit>(() => OnBoardingCubit(
        onBoardingRepo: serviceLocator.get<OnBoardingRepo>(),
      ));

  serviceLocator.registerFactory<LoginCubit>(
    () => LoginCubit(
      loginUseCase: serviceLocator.get<LoginUseCase>(),
      loginWithGoogleUseCase: serviceLocator.get<LoginWithGoogleUseCase>(),
    ),
  );

  // ==================== UseCases ====================
  serviceLocator.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(loginRepo: serviceLocator.get<LoginRepo>()),
  );

  serviceLocator.registerLazySingleton<LoginWithGoogleUseCase>(
    () => LoginWithGoogleUseCase(loginRepo: serviceLocator.get<LoginRepo>()),
  );

  // ==================== Repos ====================
  serviceLocator.registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl(
        onBoardingDataSource: serviceLocator.get<OnBoardingDataSource>(),
      ));

  serviceLocator.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(
      loginDataSource: serviceLocator.get<LoginDataSource>(),
      networkInfo: serviceLocator.get<NetworkInfo>(),
    ),
  );

  // ==================== DataSources ====================
  serviceLocator.registerLazySingleton<OnBoardingDataSource>(
    () => OnBoardingDataSourceImpl(),
  );

  serviceLocator.registerLazySingleton<LoginDataSource>(
    () => LoginDataSourceImpl(
      firebaseAuth: serviceLocator.get<FirebaseAuth>(),
    ),
  );

  // ==================== Core ====================
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: serviceLocator.get<InternetConnectionChecker>(),
    ),
  );

  // ==================== External ====================

  serviceLocator.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );

  serviceLocator
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
