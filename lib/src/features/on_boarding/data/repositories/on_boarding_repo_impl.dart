import 'package:flutter/material.dart';
import 'package:roome/src/features/on_boarding/data/datasources/on_boarding_datasource.dart';
import 'package:roome/src/features/on_boarding/domain/entities/navigate_between_pages_params.dart';
import 'package:roome/src/features/on_boarding/domain/entities/on_boarding_entity.dart';
import 'package:roome/src/features/on_boarding/domain/repositories/on_boarding_repo.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  final OnBoardingDataSource onBoardingDataSource;

  const OnBoardingRepoImpl({required this.onBoardingDataSource});

  @override
  List<OnBoardingEntity> getPages() {
    return onBoardingDataSource.getPages();
  }

  @override
  void navigateBetweenPages({
    required NavigateBetweenPagesParams params,
  }) {
    onBoardingDataSource.navigateBetweenPages(params: params);
  }

  @override
  void skipToLogin({required BuildContext context}) {
    onBoardingDataSource.skipToLogin(context: context);
  }

  @override
  void previousPage({required PageController pageController}) {
    onBoardingDataSource.previousPage(pageController: pageController);
  }
}
