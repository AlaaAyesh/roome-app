import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';

import '../utils/app_assets.dart';

class GetBackArrow extends StatelessWidget {
  const GetBackArrow({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            AppAssets.iconArrowLeft,
            color: state.brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        );
      },
    );
  }
}
