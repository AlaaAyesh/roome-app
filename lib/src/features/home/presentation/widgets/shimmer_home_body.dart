import 'package:flutter/material.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_hello_row.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_price_slider_and_search.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_tabs.dart';

class ShimmerHomeBody extends StatelessWidget {
  const ShimmerHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 16, left: 21),
        child: Column(
          children: <Widget>[
            ShimmerHelloRow(),
            SizedBox(height: 23),
            ShimmerPriceSliderAndSearch(),
            ShimmerTabs(),
          ],
        ),
      ),
    );
  }
}
