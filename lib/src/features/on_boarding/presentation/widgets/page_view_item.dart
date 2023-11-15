import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/on_boarding/domain/entities/on_boarding_entity.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.pageInfo});

  final OnBoardingEntity pageInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(50)),
          child: Image.asset(
            pageInfo.image,
            height: 429,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            pageInfo.heading,
            style: AppTextStyles.onBoardingHeadingTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            pageInfo.subHeading,
            style: AppTextStyles.textStyle15,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
