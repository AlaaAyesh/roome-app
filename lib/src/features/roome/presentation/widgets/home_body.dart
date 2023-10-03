import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import 'custom_tabs.dart';
import 'hello_row.dart';

import 'price_slider_and_search.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
