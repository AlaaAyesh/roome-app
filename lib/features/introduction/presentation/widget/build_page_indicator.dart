import 'package:flutter/material.dart';
import 'package:roome/core/global/app_assets.dart';

Widget buildPageIndicator(bool isActive) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 0.25),
    height: 8.0,
    width: 16,
    decoration: BoxDecoration(
        color: isActive ? kPrimaryColor : Colors.grey,
        shape: BoxShape.circle),
  );
}
