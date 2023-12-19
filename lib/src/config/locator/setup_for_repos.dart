import 'package:roome/service_locator.dart';
import 'package:roome/src/core/internet/internet_checker.dart';
import 'package:roome/src/features/auth/data/datasources/login/login_datasource.dart';
import 'package:roome/src/features/auth/data/datasources/sign_up/sign_up_datasource.dart';
import 'package:roome/src/features/auth/data/repositories/login_repo_impl.dart';
import 'package:roome/src/features/auth/data/repositories/sign_up_repo_impl.dart';
import 'package:roome/src/features/auth/domain/repositories/login_repo.dart';
import 'package:roome/src/features/auth/domain/repositories/sign_up_repo.dart';
import 'package:roome/src/features/favorite/data/datasources/favorite_datasource.dart';
import 'package:roome/src/features/favorite/data/repositories/favorite_repo_impl.dart';
import 'package:roome/src/features/favorite/domain/repositories/favorite_repo.dart';
import 'package:roome/src/features/home/data/datasources/hotels/hotels_datasource.dart';
import 'package:roome/src/features/home/data/datasources/near_me/near_me_datasource.dart';
import 'package:roome/src/features/home/data/datasources/recommended/recommended_datasource.dart';
import 'package:roome/src/features/home/data/repositories/hotels_repo_impl.dart';
import 'package:roome/src/features/home/data/repositories/near_me_repo_impl.dart';
import 'package:roome/src/features/home/data/repositories/recommended_repo_impl.dart';
import 'package:roome/src/features/home/domain/repositories/hotels_repo.dart';
import 'package:roome/src/features/home/domain/repositories/near_me_repo.dart';
import 'package:roome/src/features/home/domain/repositories/recommended_repo.dart';
import 'package:roome/src/features/notifications/data/datasources/notifications_datasource.dart';
import 'package:roome/src/features/notifications/data/repositories/notifications_repo_impl.dart';
import 'package:roome/src/features/notifications/domain/repositories/notifications_repo.dart';
import 'package:roome/src/features/on_boarding/data/datasources/on_boarding_datasource.dart';
import 'package:roome/src/features/on_boarding/data/repositories/on_boarding_repo_impl.dart';
import 'package:roome/src/features/on_boarding/domain/repositories/on_boarding_repo.dart';
import 'package:roome/src/features/profile/data/datasources/edit_profile/edit_profile_datasource.dart';
import 'package:roome/src/features/profile/data/datasources/profile/profile_datasource.dart';
import 'package:roome/src/features/profile/data/repositories/edit_profile_repo_impl.dart';
import 'package:roome/src/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:roome/src/features/profile/domain/repositories/edit_profile_repo.dart';
import 'package:roome/src/features/profile/domain/repositories/profile_repo.dart';
import 'package:roome/src/features/roome/data/datasources/roome_datasource.dart';
import 'package:roome/src/features/roome/data/repositories/roome_repo_impl.dart';
import 'package:roome/src/features/roome/domain/repositories/roome_repo.dart';
import 'package:roome/src/features/search/data/datasources/search_datasource.dart';
import 'package:roome/src/features/search/data/repositories/search_repo_impl.dart';
import 'package:roome/src/features/search/domain/repositories/search_repo.dart';

class SetupForRepos {
  void setUpForRepos() {
    getIt.registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl(
          onBoardingDataSource: getIt.get<OnBoardingDataSource>(),
        ));

    getIt.registerLazySingleton<LoginRepo>(
      () => LoginRepoImpl(
        loginDataSource: getIt.get<LoginDataSource>(),
        internetChecker: getIt.get<InternetChecker>(),
      ),
    );

    getIt.registerLazySingleton<SignUpRepo>(
      () => SignUpRepoImpl(
        internetChecker: getIt.get<InternetChecker>(),
        signUpDataSource: getIt.get<SignUpDataSource>(),
      ),
    );

    getIt.registerLazySingleton<RoomeRepo>(
      () => RoomeRepoImpl(
        roomeDataSource: getIt.get<RoomeDataSource>(),
        internetChecker: getIt.get<InternetChecker>(),
      ),
    );

    getIt.registerLazySingleton<SearchRepo>(() => SearchRepoImpl(
          internetChecker: getIt.get<InternetChecker>(),
          searchDatasource: getIt.get<SearchDatasource>(),
        ));

    getIt.registerLazySingleton<HotelsRepo>(() => HotelsRepoImpl(
          internetChecker: getIt.get<InternetChecker>(),
          hotelsDataSource: getIt.get<HotelsDataSource>(),
        ));

    getIt.registerLazySingleton<NearMeRepo>(
      () => NearMeRepoImpl(
          internetChecker: getIt.get<InternetChecker>(),
          nearMeDataSource: getIt.get<NearMeDataSource>()),
    );

    getIt.registerLazySingleton<RecommendedRepo>(
      () => RecommendedRepoImpl(
          internetChecker: getIt.get<InternetChecker>(),
          recommendedDataSource: getIt.get<RecommendedDataSource>()),
    );

    getIt.registerLazySingleton<FavoriteRepo>(
      () => FavoriteRepoImpl(
        internetChecker: getIt.get<InternetChecker>(),
        favoriteDataSource: getIt.get<FavoriteDataSource>(),
      ),
    );

    getIt.registerLazySingleton<NotificationsRepo>(
      () => NotificationsRepoImpl(
          notificationsDataSource: getIt.get<NotificationsDataSource>()),
    );

    getIt.registerLazySingleton<ProfileRepo>(
      () => ProfileRepoImpl(profileDataSource: getIt.get<ProfileDataSource>()),
    );

    getIt.registerLazySingleton<EditProfileRepo>(
      () => EditProfileRepoImpl(
        editProfileDataSource: getIt.get<EditProfileDataSource>(),
        internetChecker: getIt.get<InternetChecker>(),
      ),
    );
  }
}
