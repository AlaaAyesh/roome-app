import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/routes/app_routes.dart';
import 'package:roome/src/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';

import 'package:roome/src/features/auth/sign_up/presentation/widgets/sign_up_view_body.dart';

import '../../../../../core/helpers/cache_helper.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) => controlSignUpViewStates(state, context),
        builder: (context, state) {
          SignUpCubit cubit = BlocProvider.of<SignUpCubit>(context);
          return SignUpViewBody(cubit: cubit, state: state);
        },
      ),
    );
  }

  void controlSignUpViewStates(SignUpState state, BuildContext context) {
    if (state is SignUpErrorState) {
      if (state.error == 'weak-password') {
        CustomSnackBar.show(
          context: context,
          message: 'Password is too weak',
          title: "Warning",
        );
      } else if (state.error == 'email-already-in-use') {
        CustomSnackBar.show(
          context: context,
          message: 'Account already exists',
          title: "Warning",
        );
      }
    }

    if (state is SignUpSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        Navigator.pushReplacementNamed(context, Routes.homeViewRoute);

        CustomSnackBar.show(
          context: context,
          title: "Success",
          message: "Account Created Successfully",
          backgroundColor: Colors.green,
          icon: Icons.check_circle,
        );
      });
    }

    if (state is CreateUserSuccessState) {
      Navigator.pushReplacementNamed(context, Routes.homeViewRoute);
    }

    if (state is SignUpWithGoogleSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        Navigator.pushReplacementNamed(context, Routes.homeViewRoute);
      });
    }
  }
}
