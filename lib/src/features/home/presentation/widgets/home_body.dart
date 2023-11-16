import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/custom_error_widget.dart';
import 'package:roome/src/features/home/presentation/widgets/custom_tabs.dart';
import 'package:roome/src/features/home/presentation/widgets/hello_row.dart';
import 'package:roome/src/features/home/presentation/widgets/price_slider_and_search.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_home_body.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

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
              from: AppConstants.fadeInUpValue,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 16, left: 21),
                child: Column(
                  children: <Widget>[
                    HelloRow(),
                    SizedBox(height: 23),
                    PriceSliderAndSearch(),
                    CustomTabs(),
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
