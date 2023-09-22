import 'package:flutter/material.dart';
import 'package:roome/core/global/app_assets.dart';
Padding nextStartButton( int currentPage ,void Function() goToStart,void Function() goToNextPage) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        vertical: 12, horizontal: 24),
    child: ElevatedButton(
      onPressed: () {
        currentPage == 2 ? goToStart() : goToNextPage();
      },
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: kPrimaryNextColor,
          fixedSize: const Size(double.maxFinite, 55),
          textStyle: const TextStyle(color: Colors.white)),
      child: Text(
        currentPage == 2 ? 'Start' : 'Next',
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24),
      ),
    ),
  );
}
