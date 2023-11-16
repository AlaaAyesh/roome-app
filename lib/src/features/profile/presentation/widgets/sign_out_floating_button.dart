import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class SignOutFloatingButton extends StatelessWidget {
  const SignOutFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: FloatingActionButton(
        heroTag: "Floating Sign Out Button",
        backgroundColor: Colors.redAccent,
        onPressed: () {
          BlocProvider.of<RoomeCubit>(context).signOut(context);
        },
        child: const Icon(
          Icons.logout_rounded,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }
}
