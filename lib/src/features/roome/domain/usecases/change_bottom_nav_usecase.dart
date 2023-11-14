import 'package:roome/src/core/usecases/regular_usecase.dart';
import 'package:roome/src/features/roome/domain/entities/change_index_params.dart';
import 'package:roome/src/features/roome/domain/repositories/roome_repo.dart';

class ChangeBottomNavUseCase
    implements RegularUseCases<void, ChangeIndexParams> {
  final RoomeRepo roomRepo;

  const ChangeBottomNavUseCase({required this.roomRepo});

  @override
  void call(ChangeIndexParams params) {
    roomRepo.changeBottomNavIndex(
      context: params.context!,
      index: params.index!,
    );
  }
}
