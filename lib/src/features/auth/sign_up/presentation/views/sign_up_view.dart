import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../config/services/notification_service.dart';
import '../../../../../core/helpers/cache_helper.dart';
import '../../../../../core/helpers/helper.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../core/widgets/loading_dialog.dart';
import '/src/core/utils/app_navigator.dart';
import '/src/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import '/src/features/auth/sign_up/presentation/widgets/sign_up_view_body.dart';

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
    if (state is SignUpLoadingState || state is SignUpWithGoogleLoadingState) {
      showAdaptiveDialog<Widget>(
        context: context,
        builder: (context) => const LoadingDialog(),
      );
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
    CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
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
    CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
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
      title: "Warning",
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
      title: "Success",
      message: "Account Created Successfully",
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
    );
  }
}
