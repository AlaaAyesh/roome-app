import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:roome/src/config/routes/app_routes.dart';
import 'package:roome/src/core/helpers/cache_helper.dart';
import 'package:roome/src/core/widgets/custom_snack_bar.dart';
import 'package:roome/src/features/auth/sign_in/presentation/cubit/login_cubit.dart';
import 'package:roome/src/features/auth/sign_in/presentation/widgets/login_view_body.dart';

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
    if (state is SignInErrorState) {
      debugPrint("ERROR::ERROR: ${state.error}");

      CustomSnackBar.show(
        context: context,
        message: 'Something went wrong',
        title: "Warning",
      );
    }

    if (state is SignInSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        Navigator.pushReplacementNamed(context, Routes.homeViewRoute);
      });
    }

    if (state is SignInWithGoogleSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        Navigator.pushReplacementNamed(context, Routes.homeViewRoute);
      });
    }
  }
}
