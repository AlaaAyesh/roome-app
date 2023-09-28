import 'package:flutter/material.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class RoomViewBody extends StatelessWidget {
  const RoomViewBody({super.key, required this.cubit});

  final RoomeCubit cubit;

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
      child: cubit.getBody()[cubit.currentIndex],
    );
  }
}
