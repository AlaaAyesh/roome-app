import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: EdgeInsets.symmetric(vertical: 27.h, horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 24.h,
            width: 24.h,
            color: HexColorHandler('A0A0A0'),
            child: Center(
              child: InkWell(
                onTap: () => context.getBack(),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 18.h,
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
