import 'package:roome/src/core/entities/no_params.dart';
import 'package:roome/src/core/usecases/regular_usecase.dart';
import 'package:roome/src/features/onboarding/domain/entities/on_boarding_entity.dart';
import 'package:roome/src/features/onboarding/domain/repositories/on_boarding_repo.dart';

class GetOnboardingPagesUseCase
    implements RegularUseCases<List<OnBoardingEntity>, NoParams> {
  final OnBoardingRepo onBoardingRepo;

  const GetOnboardingPagesUseCase({required this.onBoardingRepo});

  @override
  List<OnBoardingEntity> call(NoParams params) {
    return onBoardingRepo.getPages();
  }
}
