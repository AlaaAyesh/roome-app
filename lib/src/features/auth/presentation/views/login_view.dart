import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:roome/service_locator.dart';
import 'package:roome/src/config/router/routes.dart';
import 'package:roome/src/core/helpers/cache_helper.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/widgets/custom_loading_dialog.dart';
import 'package:roome/src/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:roome/src/features/auth/presentation/widgets/auth_title.dart';
import 'package:roome/src/features/auth/presentation/widgets/have_account_or_not.dart';
import 'package:roome/src/features/auth/presentation/widgets/login/login_form.dart';
import 'package:roome/src/features/auth/presentation/widgets/login_with_social_buttons.dart';
import 'package:roome/src/features/auth/presentation/widgets/or_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: AppConstants.authHorizontalPadding,
            sliver: SliverToBoxAdapter(
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) =>
                    _handleLoginWithGoogleStates(state, context),
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AuthTitle(
                        title: 'Log in',
                        margin: EdgeInsets.only(bottom: 70.h, top: 140.h),
                      ),
                      const LoginForm(),
                      const OrText(),
                      SizedBox(height: 14.h),
                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return LoginWithSocialButtons(
                            googleOnTap: () {
                              BlocProvider.of<LoginCubit>(context)
                                  .signInWithGoogle();
                            },
                            appleOnTap: () {
                              // TODO: Login with Apple
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleLoginWithGoogleStates(LoginState state, BuildContext context) {
    if (state is SignInWithGoogleLoadingState) {
      CustomLoadingDialog.show(context);
    }

    if (state is SignInWithGoogleSuccessState) {
      _handleSignInWithGoogleSuccessState(context, state);
    }
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
}
