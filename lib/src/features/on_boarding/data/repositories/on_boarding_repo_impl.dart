import 'package:flutter/material.dart';
import 'package:roome/src/features/on_boarding/data/datasources/on_boarding_datasource.dart';
import 'package:roome/src/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:roome/src/features/on_boarding/domain/entities/on_boarding_entity.dart';
import 'package:roome/src/features/on_boarding/domain/repositories/on_boarding_repo.dart';

class OnBoardingRepoImpl extends OnBoardingRepo {
  final OnBoardingDataSource onBoardingDataSource;

  OnBoardingRepoImpl({required this.onBoardingDataSource});

  @override
  List<OnBoardingEntity> getPages() {
    return onBoardingDataSource.getPages();
  }

  @override
  void navigateBetweenPages({
    required BuildContext context,
    required PageController pageController,
    required bool isLastBoarding,
  }) {
    onBoardingDataSource.navigateBetweenPages(
      context: context,
      pageController: pageController,
      isLastBoarding: isLastBoarding,
    );
  }

  @override
  void navigateToAuth({required BuildContext context}) {
    onBoardingDataSource.navigateToAuth(context: context);
  }

  @override
  void onChangePageIndex({
    required int index,
    required List<OnBoardingModel> pages,
    required bool isLastBoarding,
  }) {
    onBoardingDataSource.onChangePageIndex(
      index: index,
      pages: pages,
      isLastBoarding: isLastBoarding,
    );
  }
}
