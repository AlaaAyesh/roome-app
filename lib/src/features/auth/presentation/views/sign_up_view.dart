import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:roome/service_locator.dart';
import 'package:roome/src/config/router/routes.dart';
import 'package:roome/src/config/services/notification_service.dart';
import 'package:roome/src/core/helpers/cache_helper.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/core/widgets/custom_loading_dialog.dart';
import 'package:roome/src/core/widgets/custom_sliver_app_bar.dart';
import 'package:roome/src/core/widgets/custom_snack_bar.dart';
import 'package:roome/src/features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:roome/src/features/auth/presentation/widgets/auth_title.dart';
import 'package:roome/src/features/auth/presentation/widgets/have_account_or_not.dart';
import 'package:roome/src/features/auth/presentation/widgets/login_with_social_buttons.dart';
import 'package:roome/src/features/auth/presentation/widgets/or_text.dart';
import 'package:roome/src/features/auth/presentation/widgets/sign_up/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) => controlSignUpViewStates(state, context),
        builder: (context, state) {
          SignUpCubit cubit = BlocProvider.of<SignUpCubit>(context);
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                const CustomSliverAppBar(),
                SliverPadding(
                  padding: AppConstants.authHorizontalPadding,
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AuthTitle(
                          title: 'Sign up',
                          margin: EdgeInsets.only(top: 40.h, bottom: 50.h),
                        ),
                        SignUpForm(cubit: cubit, state: state),
                        const OrText(),
                        SizedBox(height: 16.h),
                        LoginWithSocialButtons(
                          googleOnTap: () {},
                          appleOnTap: () {
                            // TODO: Sign up with Apple
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
                        onTap: () => context.getBack(),
                        buttonText: 'Log in',
                        question: 'Already have an account?',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void controlSignUpViewStates(SignUpState state, BuildContext context) {
    if (state is SignUpLoadingState || state is SignUpWithGoogleLoadingState) {
      CustomLoadingDialog.show(context);
    }

    if (state is SignUpErrorState) {
      _handleSignUpErrorState(context, state);
    }

    if (state is SignUpSuccessState) {
      _handleSignUpSuccessState(context, state);
    }

    if (state is SignUpWithGoogleSuccessState) {
      _handleSignUpWithGoogleSuccessState(context, state);
    }
  }

  void _handleSignUpWithGoogleSuccessState(
    BuildContext context,
    SignUpWithGoogleSuccessState state,
  ) {
    context.getBack();
    serviceLocator
        .get<CacheHelper>()
        .saveData(key: 'uId', value: state.uId)
        .then((value) {
      if (value) {
        Helper.uId = int.parse(state.uId);
        Helper.getUserAndFavorites(context);
        _accountCreatedSnackBar(context);
        context.navigateAndReplacement(newRoute: Routes.roomViewRoute);
      }
    });
  }

  void _handleSignUpSuccessState(
    BuildContext context,
    SignUpSuccessState state,
  ) {
    context.getBack();
    serviceLocator
        .get<CacheHelper>()
        .saveData(key: 'uId', value: state.uId)
        .then((value) {
      if (value) {
        Helper.uId = state.uId;
        Helper.getUserAndFavorites(context);
        _accountCreatedSnackBar(context);
        context.navigateAndReplacement(newRoute: Routes.roomViewRoute);
        _sayHelloNotification(state);
      }
    });
  }

  void _handleSignUpErrorState(BuildContext context, SignUpErrorState state) {
    context.getBack();
    CustomSnackBar.show(
      context: context,
      message: state.error,
      state: CustomSnackBarState.error,
    );
  }

  void _sayHelloNotification(SignUpSuccessState state) {
    NotificationService.triggerNotification(
      title: AppStrings.helloFromRoome,
      body:
          'Hello from Roome, ${state.userModel.firstName} ${AppStrings.waveEmoji}',
    );
  }

  void _accountCreatedSnackBar(BuildContext context) {
    CustomSnackBar.show(
      context: context,
      message: "Account Created Successfully",
      state: CustomSnackBarState.success,
    );
  }
}
