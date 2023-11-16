import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_navigator.dart';

class GetBackArrow extends StatelessWidget {
  const GetBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return InkWell(
            onTap: () => context.getBack(),
            child: const Icon(Icons.arrow_back_ios_new));
      },
    );
  }
}
