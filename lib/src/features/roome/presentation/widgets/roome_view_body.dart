import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class RoomeViewBody extends StatelessWidget {
  const RoomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomeCubit, RoomeState>(
      builder: (context, state) {
        RoomeCubit cubit = RoomeCubit.getObject(context);
        return WillPopScope(
          onWillPop: () {
            if (cubit.currentIndex != 0) {
              cubit.changeBottomNavToHome(context);
              cubit.getUserData();
              return Future.value(false);
            }
            return Future.value(true);
          },
          child: cubit.getBody()[cubit.currentIndex],
        );
      },
    );
  }
}
