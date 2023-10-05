import 'package:flutter/material.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class RoomViewBody extends StatelessWidget {
  const RoomViewBody({
    super.key,
    required this.cubit,
    required this.state,
  });

  final RoomeCubit cubit;
  final RoomeState state;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (cubit.currentIndex != 0) {
          cubit.changeBottomNavToHome(context);
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: cubit.getBody(
        roomeState: state,
        roomeCubit: cubit,
      )[cubit.currentIndex],
    );
  }
}
