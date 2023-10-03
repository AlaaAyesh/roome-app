import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';
import 'package:roome/src/features/roome/presentation/widgets/bottom_nav_bar.dart';
import 'package:roome/src/features/roome/presentation/widgets/room_view_body.dart';

class RoomeView extends StatelessWidget {
  const RoomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomeCubit, RoomeState>(
      builder: (context, state) {
        RoomeCubit cubit = BlocProvider.of<RoomeCubit>(context);

        return Scaffold(
          body: SafeArea(child: RoomViewBody(cubit: cubit)),
          bottomNavigationBar: BottomNavBar(cubit: cubit),
        );
      },
    );
  }
}
