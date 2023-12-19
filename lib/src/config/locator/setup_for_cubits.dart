import 'package:roome/service_locator.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/features/auth/domain/usecases/login/login_with_google_usecase.dart';
import 'package:roome/src/features/auth/domain/usecases/login/user_login_usecase.dart';
import 'package:roome/src/features/auth/domain/usecases/sign_up/sign_up_with_google_usecase.dart';
import 'package:roome/src/features/auth/domain/usecases/sign_up/user_sign_up_usecase.dart';
import 'package:roome/src/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:roome/src/features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:roome/src/features/booking/presentation/cubits/booking_one/booking_one_cubit.dart';
import 'package:roome/src/features/booking/presentation/cubits/payment/payment_cubit.dart';
import 'package:roome/src/features/favorite/domain/usecases/add_to_fav_usecase.dart';
import 'package:roome/src/features/favorite/domain/usecases/get_favorites_usecase.dart';
import 'package:roome/src/features/favorite/domain/usecases/remove_from_fav_usecase.dart';
import 'package:roome/src/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:roome/src/features/home/domain/usecases/hotels/get_hotels_usecase.dart';
import 'package:roome/src/features/home/domain/usecases/near_me/get_near_me_hotels_usecase.dart';
import 'package:roome/src/features/home/domain/usecases/recommended/get_recommended_hotels_usecase.dart';
import 'package:roome/src/features/home/presentation/cubits/hotels/hotels_cubit.dart';
import 'package:roome/src/features/home/presentation/cubits/near_me/near_me_cubit.dart';
import 'package:roome/src/features/home/presentation/cubits/recommended/recommended_cubit.dart';
import 'package:roome/src/features/notifications/domain/usecases/add_to_notifications_usecase.dart';
import 'package:roome/src/features/notifications/domain/usecases/remove_from_notifications_usecase.dart';
import 'package:roome/src/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:roome/src/features/on_boarding/domain/usecases/get_onboarding_pages_usecase.dart';
import 'package:roome/src/features/on_boarding/domain/usecases/navigate_between_pages_usecase.dart';
import 'package:roome/src/features/on_boarding/domain/usecases/previous_page_usecase.dart';
import 'package:roome/src/features/on_boarding/domain/usecases/skip_to_login_usecase.dart';
import 'package:roome/src/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:roome/src/features/profile/domain/usecases/edit_profile_usecases/get_profile_image_usecase.dart';
import 'package:roome/src/features/profile/domain/usecases/edit_profile_usecases/update_user_usecase.dart';
import 'package:roome/src/features/profile/domain/usecases/edit_profile_usecases/upload_profile_image_usecase.dart';
import 'package:roome/src/features/profile/domain/usecases/sign_out_usecase.dart';
import 'package:roome/src/features/profile/presentation/cubits/edit_profile/edit_profile_cubit.dart';
import 'package:roome/src/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:roome/src/features/roome/domain/usecases/change_bottom_nav_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/change_nav_to_home_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/get_body_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/get_bottom_nav_items_usecase.dart';
import 'package:roome/src/features/roome/domain/usecases/get_user_data_usecase.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';
import 'package:roome/src/features/search/domain/usecases/search_hotels_usecase.dart';
import 'package:roome/src/features/search/presentation/cubit/search_cubit.dart';

class SetupForCubits {
  void setUpForCubits() {
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

    getIt.registerFactory<ProfileCubit>(
      () => ProfileCubit(signOutUseCase: getIt.get<SignOutUseCase>()),
    );

    getIt.registerFactory<EditProfileCubit>(
      () => EditProfileCubit(
        getProfileImageUseCase: getIt.get<GetProfileImageUseCase>(),
        updateUserUseCase: getIt.get<UpdateUserUseCase>(),
        uploadProfileImageUseCase: getIt.get<UploadProfileImageUseCase>(),
      ),
    );
  }
}
