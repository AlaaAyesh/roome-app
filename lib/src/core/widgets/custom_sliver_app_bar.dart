import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/get_back_arrow.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    this.titleText,
    this.leading,
    this.actions,
    this.centerTitle,
    this.arrowBackOnTap,
    this.title,
  });

  final Widget? title;
  final String? titleText;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final void Function()? arrowBackOnTap;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: leading ?? GetBackArrow(onTap: arrowBackOnTap),
      actions: actions,
      centerTitle: centerTitle,
      title: titleText != null
          ? BlocBuilder<ThemesCubit, ThemeData>(
              builder: (context, state) {
                return Text(
                  titleText!,
                  style: state.brightness == Brightness.light
                      ? AppTextStyles.appBarTextStyle
                      : AppTextStyles.appBarTextStyle.copyWith(
                          color: Colors.white,
                        ),
                );
              },
            )
          : title,
    );
  }
}
