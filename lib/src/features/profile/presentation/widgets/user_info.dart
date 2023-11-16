import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.title,
    required this.info,
  });

  final String title;
  final String? info;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(title, style: AppTextStyles.textStyle15),
        Flexible(
          child: BlocBuilder<ThemesCubit, ThemeData>(
            builder: (context, state) {
              return Text(
                info ?? 'Unknown',
                style: info == null
                    ? AppTextStyles.textStyle15.copyWith(
                        fontWeight: FontWeight.w500,
                        color: state.brightness == Brightness.light
                            ? Colors.black.withOpacity(0.46)
                            : Colors.white,
                      )
                    : AppTextStyles.textStyle15.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              );
            },
          ),
        ),
      ],
    );
  }
}
