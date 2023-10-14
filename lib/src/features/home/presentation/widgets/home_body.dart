import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/widgets/custom_error_widget.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_home_body.dart';

import '../../../roome/presentation/cubit/roome_cubit.dart';
import 'custom_tabs.dart';
import 'hello_row.dart';
import 'price_slider_and_search.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomeCubit, RoomeState>(
      builder: (context, state) {
        if (state is GetUserDataLoadingState) {
          return const ShimmerHomeBody();
        } else if (state is GetUserDataSuccessState) {
          return SingleChildScrollView(
            child: FadeInUp(
              from: 20.h,
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
            ),
          );
        } else if (state is GetUserDataErrorState) {
          return CustomErrorWidget(
            error: state.error,
            onPressed: () => RoomeCubit.getObject(context).getUserData(),
          );
        } else {
          return const ShimmerHomeBody();
        }
      },
    );
  }
}
