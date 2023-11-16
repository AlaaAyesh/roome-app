import 'package:flutter/material.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/models/hotel.dart';
import 'package:roome/src/features/details/presentation/widgets/more_details_images.dart';

class MoreImages extends StatelessWidget {
  const MoreImages({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 19,
      right: 19,
      child: Column(
        children: List.generate(
          Helper.getLength(hotel.images!),
          (index) => MoreDetailsImages(
            index: index,
            lastIndex: Helper.getLength(hotel.images!) - 1,
            imagesNumber: Helper.getLength(hotel.images!),
            hotel: hotel,
            image: hotel.images![index].path!,
          ),
        ),
      ),
    );
  }
}
