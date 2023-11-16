import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/get_back_arrow.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.title,
    this.leading = const GetBackArrow(),
    this.actions,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: leading,
      actions: actions,
      title: BlocBuilder<ThemesCubit, ThemeData>(
        builder: (context, state) {
          return Text(
            title,
            style: state.brightness == Brightness.light
                ? AppTextStyles.appBarTextStyle
                : AppTextStyles.appBarTextStyle.copyWith(
                    color: Colors.white,
                  ),
          );
        },
      ),
    );
  }
}
