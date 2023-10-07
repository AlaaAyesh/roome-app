import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_components/reusable_components.dart';

import '../cubits/roome/roome_cubit.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomTextButton(
          onTap: () {
            BlocProvider.of<RoomeCubit>(context).signOut(context);
          },
          child: const Text('Sign Out'),
        ),
      ],
    );
  }
}
