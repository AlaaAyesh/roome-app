import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_hello_row.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_price_slider_and_search.dart';
import 'package:roome/src/features/home/presentation/widgets/shimmer_tabs.dart';

class ShimmerHomeBody extends StatelessWidget {
  const ShimmerHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 16.h,
          left: AppConstants.horizontalViewPaddingValue,
        ),
        child: Column(
          children: <Widget>[
            const ShimmerHelloRow(),
            SizedBox(height: 23.h),
            const ShimmerPriceSliderAndSearch(),
            const ShimmerTabs(),
          ],
        ),
      ),
    );
  }
}
