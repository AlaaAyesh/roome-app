import 'package:flutter/material.dart';
import 'package:roome/src/core/helpers/hex_color_handler.dart';
import 'package:roome/src/core/models/hotel.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/widgets/love_border_icon.dart';

class ArrowBackAndLoveIcon extends StatelessWidget {
  const ArrowBackAndLoveIcon({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 24,
            width: 24,
            color: HexColorHandler('A0A0A0'),
            child: Center(
              child: InkWell(
                onTap: () => context.getBack(),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
          LoveBorderIcon(
            hotel: hotel,
            iconSize: 24,
            borderColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
