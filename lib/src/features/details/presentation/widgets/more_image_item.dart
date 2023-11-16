import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:roome/src/core/widgets/custom_error_icon.dart';

class MoreImageItem extends StatelessWidget {
  const MoreImageItem({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: CachedNetworkImage(
          imageUrl: image,
          height: 64,
          width: 64,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const CustomErrorIcon(),
        ),
      ),
    );
  }
}
