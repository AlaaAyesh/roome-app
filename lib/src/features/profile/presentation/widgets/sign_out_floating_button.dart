import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/router/routes.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class SignOutFloatingButton extends StatelessWidget {
  const SignOutFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) => _handleSignOutStates(state, context),
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 5.0.w),
          child: FloatingActionButton(
            heroTag: "Floating Sign Out Button",
            backgroundColor: Colors.redAccent,
            onPressed: () {
              BlocProvider.of<ProfileCubit>(context).signOut();
            },
            child: Icon(
              Icons.logout_rounded,
              color: Colors.white,
              size: 22.h,
            ),
          ),
        );
      },
    );
  }

  void _handleSignOutStates(ProfileState state, BuildContext context) {
    if (state is SignOutSuccessState) {
      Helper.uId = null;
      // So when the user login again, he navigates to Home not profile
      BlocProvider.of<RoomeCubit>(context).currentIndex = 0;
      context.navigateAndRemoveUntil(newRoute: Routes.loginViewRoute);
    }
  }
}
