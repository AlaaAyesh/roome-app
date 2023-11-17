import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/config/services/notification_service.dart';
import 'package:roome/src/core/helpers/cache_helper.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/core/utils/service_locator.dart';
import 'package:roome/src/features/auth/presentation/widgets/auth_title.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/core/widgets/custom_snack_bar.dart';
import 'package:roome/src/features/auth/presentation/widgets/have_account_or_not.dart';
import 'package:roome/src/features/auth/presentation/widgets/loading_dialog.dart';
import 'package:roome/src/features/auth/presentation/widgets/login_with_social_buttons.dart';
import 'package:roome/src/features/auth/presentation/widgets/or_text.dart';
import 'package:roome/src/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:roome/src/features/auth/presentation/widgets/login/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) => controlSignInViewStates(state, context),
        builder: (context, state) {
          LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(top: 70, left: 38, right: 38),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const AuthTitle(
                        title: 'Log in',
                        margin: EdgeInsets.symmetric(vertical: 69),
                      ),
                      LoginForm(cubit: cubit, state: state),
                      const OrText(),
                      const SizedBox(height: 14),
                      LoginWithSocialButtons(
                        googleOnTap: () => cubit.signInWithGoogle(),
                        appleOnTap: () {
                          // TODO: Login with Apple
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    HaveAccountOrNot(
                      onTap: () {
                        context.navigateTo(routeName: Routes.signUpViewRoute);
                      },
                      buttonText: 'Sign up',
                      question: "Don't have an account?",
                    ),
                    const BottomSpacer(height: 16),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void controlSignInViewStates(LoginState state, BuildContext context) {
    if (state is SignInLoadingState || state is SignInWithGoogleLoadingState) {
      showAdaptiveDialog<Widget>(
        context: context,
        builder: (context) => const LoadingDialog(),
      );
    }
    if (state is SignInSuccessState) {
      _handleSignInSuccessState(context, state);
    }

    if (state is SignInWithGoogleSuccessState) {
      _handleSignInWithGoogleSuccessState(context, state);
    }

    if (state is SignInErrorState) {
      _handleSignInErrorState(context, state);
    }
  }

  void _handleSignInErrorState(BuildContext context, SignInErrorState state) {
    context.getBack();
    CustomSnackBar.show(
      context: context,
      message: state.error,
      title: "Warning",
    );
  }

  void _handleSignInWithGoogleSuccessState(
    BuildContext context,
    SignInWithGoogleSuccessState state,
  ) {
    context.getBack();
    serviceLocator
        .get<CacheHelper>()
        .saveData(key: 'uId', value: state.uId)
        .then((value) {
      if (value) {
        Helper.uId = int.parse(state.uId);
        Helper.getUserAndFavorites(context);
        context.navigateAndReplacement(newRoute: Routes.roomViewRoute);
      }
    });
  }

  void _handleSignInSuccessState(
    BuildContext context,
    SignInSuccessState state,
  ) {
    context.getBack();
    serviceLocator
        .get<CacheHelper>()
        .saveData(key: 'uId', value: state.uId)
        .then((value) {
      if (value) {
        Helper.uId = state.uId;
        Helper.getUserAndFavorites(context);
        context.navigateAndReplacement(newRoute: Routes.roomViewRoute);
        _weMissedYouNotification(state);
      }
    });
  }

  void _weMissedYouNotification(SignInSuccessState state) {
    NotificationService.triggerNotification(
      title: AppStrings.welcomeBack,
      body:
          'We missed you, ${state.userModel.firstName} ${AppStrings.smilingFaceEmoji}',
    );
  }
}
