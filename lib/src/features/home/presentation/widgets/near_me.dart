import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/home/presentation/widgets/explore_list.dart';
import 'package:roome/src/features/home/presentation/widgets/near_me_hotels.dart';
import 'package:roome/src/features/home/presentation/widgets/offers_list.dart';
import 'package:roome/src/features/home/presentation/widgets/see_all_text_button.dart';

class NearMe extends StatelessWidget {
  const NearMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const NearMeHotels(),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: SeeAllTextButton(
              onTap: () => context.navigateTo(
                routeName: Routes.nearMeSeeAllViewRoute,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BlocBuilder<ThemesCubit, ThemeData>(
                builder: (context, state) {
                  return Text(
                    'Explore',
                    style: AppTextStyles.hintStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: state.brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  );
                },
              ),
              SeeAllTextButton(
                onTap: () => context.navigateTo(
                  routeName: Routes.exploreSeeAllViewRoute,
                ),
              )
            ],
          ),
          const ExploreList(),
          const SizedBox(height: 20),
          const OffersList(),
        ],
      ),
    );
  }
}
