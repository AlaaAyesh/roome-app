import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:roome/src/core/helpers/cache_helper.dart';
import 'package:roome/src/core/utils/app_navigator.dart';

import 'package:roome/src/core/widgets/custom_snack_bar.dart';
import 'package:roome/src/features/auth/sign_in/presentation/cubit/login_cubit.dart';
import 'package:roome/src/features/auth/sign_in/presentation/widgets/login_view_body.dart';
import 'package:roome/src/features/roome/presentation/cubits/roome/roome_cubit.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/helpers/helper.dart';
import '../../../../../core/widgets/auth_loading_dialog.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          controlSignInViewStates(state, context);
        },
        builder: (context, state) {
          LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
          return LoginViewBody(cubit: cubit, state: state);
        },
      ),
    );
  }

  void controlSignInViewStates(LoginState state, BuildContext context) {
    if (state is SignInLoadingState || state is SignInWithGoogleLoadingState) {
      showAdaptiveDialog<Widget>(
        context: context,
        builder: (context) => const AuthLoadingDialog(),
      );
    }

    if (state is SignInErrorState) {
      CustomSnackBar.show(
        context: context,
        message: state.error,
        title: "Warning",
      );
    }

    if (state is SignInSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        if (value) {
          Helper.uId = state.uId;
          BlocProvider.of<RoomeCubit>(context).getUserData();
          context.navigateAndReplacement(newRoute: Routes.roomViewRoute);
        }
      });
    }

    if (state is SignInWithGoogleSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        if (value) {
          Helper.uId = int.parse(state.uId);
          BlocProvider.of<RoomeCubit>(context).getUserData();
          context.navigateAndReplacement(newRoute: Routes.roomViewRoute);
        }
      });
    }
  }
}
