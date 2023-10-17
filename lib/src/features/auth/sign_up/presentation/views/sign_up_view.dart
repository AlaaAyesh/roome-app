import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:roome/src/features/auth/sign_up/presentation/widgets/sign_up_view_body.dart';

import '../../../../../config/services/notification_service.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../core/helpers/cache_helper.dart';
import '../../../../../core/helpers/helper.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/loading_dialog.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../roome/presentation/cubit/roome_cubit.dart';

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
    } else {
      context.getBack();
    }

    if (state is SignUpErrorState) {
      CustomSnackBar.show(
        context: context,
        message: state.error,
        title: "Warning",
      );
    }

    if (state is SignUpSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        if (value) {
          Helper.uId = state.uId;
          BlocProvider.of<RoomeCubit>(context).getUserData();
          CustomSnackBar.show(
            context: context,
            title: "Success",
            message: "Account Created Successfully",
            backgroundColor: Colors.green,
            icon: Icons.check_circle,
          );

          context.navigateAndReplacement(newRoute: Routes.roomViewRoute);

          NotificationService.triggerNotification(
            title: AppStrings.helloFromRoome,
            body:
                'Hello from Roome, ${Helper.currentUser!.firstName} ${AppStrings.waveEmoji}',
          );
        }
      });
    }

    if (state is SignUpWithGoogleSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        if (value) {
          Helper.uId = int.parse(state.uId);
          BlocProvider.of<RoomeCubit>(context).getUserData();
          CustomSnackBar.show(
            context: context,
            title: "Success",
            message: "Account Created Successfully",
            backgroundColor: Colors.green,
            icon: Icons.check_circle,
          );

          context.navigateAndReplacement(newRoute: Routes.roomViewRoute);

          NotificationService.triggerNotification(
            title: AppStrings.helloFromRoome,
            body:
                'Hello from Roome, ${Helper.currentUser!.firstName} ${AppStrings.waveEmoji}',
          );
        }
      });
    }
  }
}
