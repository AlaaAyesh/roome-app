import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/custom_sliver_app_bar.dart';
import 'package:roome/src/features/home/presentation/cubits/hotels/hotels_cubit.dart';
import 'package:roome/src/features/home/presentation/widgets/see_all_items.dart';

class ExploreSeeAllView extends StatelessWidget {
  const ExploreSeeAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: AppConstants.physics,
          slivers: <Widget>[
            const CustomSliverAppBar(titleText: 'Explore'),
            SliverFillRemaining(
              child: SeeAllItems(
                hotels: BlocProvider.of<HotelsCubit>(context).resultHotels,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
