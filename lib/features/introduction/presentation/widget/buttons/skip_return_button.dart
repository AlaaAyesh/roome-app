import 'package:flutter/material.dart';
import 'package:roome/core/global/app_assets.dart';

Padding skipReturnButton( int currentPage ,void Function() returnPage,void Function() skipIntroduction) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        vertical: 12, horizontal: 24),
    child: ElevatedButton(
      onPressed: () {
        currentPage == 2
            ? returnPage()
            : skipIntroduction();
      },
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: kPrimarySkipColor,
          fixedSize: const Size(double.maxFinite, 55),
          textStyle: const TextStyle(color: Colors.black)),
      child: Text(
        currentPage == 2 ? 'Return' : 'Skip',
        style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24),
      ),
    ),
  );
}
