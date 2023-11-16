import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/home/presentation/widgets/disabled_search_field.dart';
import 'package:roome/src/features/home/presentation/widgets/price_slider.dart';

class PriceSliderAndSearch extends StatelessWidget {
  const PriceSliderAndSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 0,
      ),
      padding: const EdgeInsets.only(top: 11, left: 13, bottom: 11),
      margin: const EdgeInsets.only(right: 26),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Price Range Per Night',
            style: AppTextStyles.textStyle14Medium.copyWith(
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 50),
          const PriceSlider(),
          const SizedBox(height: 5),
          BlocBuilder<ThemesCubit, ThemeData>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(child: DisabledSearchField(state: state)),
                    const SizedBox(width: 10),
                    Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        color: state.brightness == Brightness.light
                            ? Colors.white
                            : AppColors.darkGreyColor,
                        border: Border.all(
                          color: AppColors.grey.withOpacity(0.42),
                        ),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {}, // TODO: Filtering Logic
                          child: const Icon(
                            Icons.filter_list,
                            size: 22,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
