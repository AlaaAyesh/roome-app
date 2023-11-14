import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.title,
    required this.info,
    this.isRoomType = false,
  });

  final String title;
  final String info;
  final bool isRoomType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BlocBuilder<ThemesCubit, ThemeData>(
          builder: (context, state) {
            return Text(
              '$title:',
              style: AppTextStyles.textStyle12.copyWith(
                fontWeight: FontWeight.w600,
                color: state.brightness == Brightness.light
                    ? Colors.black.withOpacity(0.6)
                    : AppColors.white60,
              ),
            );
          },
        ),
        Text(
          info,
          style: isRoomType
              ? AppTextStyles.textStyle14Medium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor.withOpacity(0.94),
                )
              : AppTextStyles.textStyle12.copyWith(
                  fontWeight: FontWeight.w600,
                ),
        ),
      ],
    );
  }
}
