import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/custom_error_icon.dart';
import 'package:roome/src/features/home/data/models/offer_model.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required this.offerModel,
    required this.index,
  });

  final OfferModel offerModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: CachedNetworkImage(
            imageUrl: offerModel.imageUrl,
            fit: BoxFit.cover,
            height: 130,
            width: 300,
            errorWidget: (context, url, error) => const CustomErrorIcon(),
          ),
        ),
        Positioned(
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Get',
                style: AppTextStyles.onBoardingButtonStyle.copyWith(
                  fontSize: 20,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '${offerModel.offer} OFF',
                    style: AppTextStyles.onBoardingButtonStyle.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    'on your',
                    style: AppTextStyles.onBoardingButtonStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                'first booking',
                style: AppTextStyles.onBoardingButtonStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
