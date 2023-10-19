import '/src/core/usecases/regular_usecase.dart';
import '/src/features/roome/domain/entities/change_index_params.dart';
import '/src/features/roome/domain/repositories/roome_repo.dart';

class ChangeBottomNavToHomeUseCase
    implements RegularUseCases<void, ChangeIndexParams> {
  final RoomeRepo roomRepo;

  const ChangeBottomNavToHomeUseCase({required this.roomRepo});

  @override
  void call(ChangeIndexParams params) {
    roomRepo.changeBottomNavToHome(context: params.context!);
  }
}
