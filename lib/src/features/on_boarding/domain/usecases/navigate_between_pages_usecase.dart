import 'package:roome/src/core/usecases/regular_usecase.dart';
import 'package:roome/src/features/on_boarding/domain/entities/navigate_between_pages_params.dart';
import 'package:roome/src/features/on_boarding/domain/repositories/on_boarding_repo.dart';

class NavigateBetweenPagesUseCase
    implements RegularUseCases<void, NavigateBetweenPagesParams> {
  final OnBoardingRepo onBoardingRepo;

  const NavigateBetweenPagesUseCase({required this.onBoardingRepo});

  @override
  void call(NavigateBetweenPagesParams params) {
    onBoardingRepo.navigateBetweenPages(params: params);
  }
}
