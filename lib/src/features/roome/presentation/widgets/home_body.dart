import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import 'package:roome/src/core/widgets/my_circular_progress_indicator.dart';

import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

import '../../../../core/helpers/helper.dart';
import 'custom_tabs.dart';
import 'hello_row.dart';

import 'price_slider_and_search.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.state});

  final RoomeState state;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition:
          state is! GetUserDataLoadingState && Helper.currentUser != null,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 16.h,
              left: 21.w,
            ),
            child: Column(
              children: <Widget>[
                const HelloRow(),
                SizedBox(height: SizeConfig.screenHeight! * 0.023),
                const PriceSliderAndSearch(),
                const CustomTabs(),
              ],
            ),
          ),
        );
      },
      fallback: (context) => const MyCircularProgressIndicator(),
    );
  }
}
