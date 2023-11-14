import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/widgets/custom_app_bar.dart';
import 'package:roome/src/features/home/presentation/cubits/near_me/near_me_cubit.dart';
import 'package:roome/src/features/home/presentation/widgets/see_all_items.dart';

class NearMeSeeAllViewBody extends StatelessWidget {
  const NearMeSeeAllViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              top: 40.h,
              bottom: 16.h,
              right: 27.w,
              left: 14.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomAppBar(
                  spaceBetween: 40,
                  title: 'Near Me',
                  arrowOnTap: () => context.getBack(),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.01),
                SeeAllItems(
                  hotels: BlocProvider.of<NearMeCubit>(context).resultNearMe,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
