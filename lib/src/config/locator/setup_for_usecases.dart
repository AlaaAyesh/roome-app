import 'package:roome/service_locator.dart';
import 'package:roome/src/features/auth/domain/repositories/login_repo.dart';
import 'package:roome/src/features/auth/domain/repositories/sign_up_repo.dart';
import 'package:roome/src/features/auth/domain/usecases/login/login_with_google_usecase.dart';
import 'package:roome/src/features/auth/domain/usecases/login/user_login_usecase.dart';
import 'package:roome/src/features/auth/domain/usecases/sign_up/sign_up_with_google_usecase.dart';
import 'package:roome/src/features/auth/domain/usecases/sign_up/user_sign_up_usecase.dart';
import 'package:roome/src/features/favorite/domain/repositories/favorite_repo.dart';
import 'package:roome/src/features/favorite/domain/usecases/add_to_fav_usecase.dart';
import 'package:roome/src/features/favorite/domain/usecases/get_favorites_usecase.dart';
import 'package:roome/src/features/favorite/domain/usecases/remove_from_fav_usecase.dart';
import 'package:roome/src/features/home/domain/repositories/hotels_repo.dart';
import 'package:roome/src/features/home/domain/repositories/near_me_repo.dart';
import 'package:roome/src/features/home/domain/repositories/recommended_repo.dart';
import 'package:roome/src/features/home/domain/usecases/hotels/get_hotels_usecase.dart';
import 'package:roome/src/features/home/domain/usecases/near_me/get_near_me_hotels_usecase.dart';
import 'package:roome/src/features/home/domain/usecases/recommended/get_recommended_hotels_usecase.dart';
import 'package:roome/src/features/notifications/domain/repositories/notifications_repo.dart';
import 'package:roome/src/features/notifications/domain/usecases/add_to_notifications_usecase.dart';
import 'package:roome/src/features/notifications/domain/usecases/remove_from_notifications_usecase.dart';
import 'package:roome/src/features/onboarding/domain/repositories/on_boarding_repo.dart';
import 'package:roome/src/features/onboarding/domain/usecases/get_onboarding_pages_usecase.dart';
import 'package:roome/src/features/onboarding/domain/usecases/navigate_between_pages_usecase.dart';
import 'package:roome/src/features/onboarding/domain/usecases/previous_page_usecase.dart';
import 'package:roome/src/features/onboarding/domain/usecases/skip_to_login_usecase.dart';
import 'package:roome/src/features/profile/domain/repositories/edit_profile_repo.dart';
import 'package:roome/src/features/profile/domain/repositories/profile_repo.dart';
import 'package:roome/src/features/profile/domain/usecases/edit_profile_usecases/get_profile_image_usecase.dart';
import 'package:roome/src/features/profile/domain/usecases/edit_profile_usecases/update_user_usecase.dart';
import 'package:roome/src/features/profile/domain/usecases/edit_profile_usecases/upload_profile_image_usecase.dart';
import 'package:roome/src/features/profile/domain/usecases/sign_out_usecase.dart';
import 'package:roome/src/features/roome/domain/repositories/roome_repo.dart';
import 'package:roome/src/features/roome/domain/usecases/change_bottom_nav_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/change_nav_to_home_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/get_body_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/get_bottom_nav_items_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/get_user_data_usecase.dart';
import 'package:roome/src/features/search/domain/repositories/search_repo.dart';
import 'package:roome/src/features/search/domain/usecases/search_hotels_usecase.dart';

class SetupForUseCases {
  void setUpForUseCases() {
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
      () => SignOutUseCase(profileRepo: getIt.get<ProfileRepo>()),
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
      () => UpdateUserUseCase(editProfileRepo: getIt.get<EditProfileRepo>()),
    );

    getIt.registerLazySingleton<GetProfileImageUseCase>(
      () => GetProfileImageUseCase(
        editProfileRepo: getIt.get<EditProfileRepo>(),
      ),
    );

    getIt.registerLazySingleton<UploadProfileImageUseCase>(
      () => UploadProfileImageUseCase(
        editProfileRepo: getIt.get<EditProfileRepo>(),
      ),
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
}
