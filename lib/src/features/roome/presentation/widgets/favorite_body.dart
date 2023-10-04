import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/widgets/separator_widget.dart';

import '/src/core/widgets/custom_app_bar.dart';
import 'favorite_card.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
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
            const CustomAppBar(
              spaceBetween: 14,
              title: 'Favorite',
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.047),
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => const FavoriteCard(),
              separatorBuilder: (context, index) =>
                  const SeparatorWidget(height: 33),
            ),
          ],
        ),
      ),
    );
  }
}
