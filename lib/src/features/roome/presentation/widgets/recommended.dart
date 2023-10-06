import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/features/roome/presentation/widgets/hotel_card.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  //TODO: use BlocBuilder here to control states when you use API and cubit

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.screenHeight! * 0.015,
        right: 26.w,
      ),
      child: GridView.builder(
        itemBuilder: (context, index) => AnimationConfiguration.staggeredGrid(
          position: index,
          duration: const Duration(milliseconds: 500),
          delay: const Duration(milliseconds: 100),
          columnCount: 15,
          child: ScaleAnimation(
            child: FadeInAnimation(
              child: HotelCard(
                cardHeight: SizeConfig.screenHeight! * 0.24,
                cardWidth: SizeConfig.screenWidth! * 0.4,
              ),
            ),
          ),
        ),
        itemCount: 15,
        scrollDirection: Axis.vertical,
        reverse: false,
        primary: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        dragStartBehavior: DragStartBehavior.start,
        clipBehavior: Clip.hardEdge,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 220,
          mainAxisSpacing: 20,
          crossAxisSpacing: 15,
          childAspectRatio: 3 / 2,
        ),
      ),
    );
  }
}
