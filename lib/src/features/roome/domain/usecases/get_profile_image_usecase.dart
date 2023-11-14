import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/roome/domain/repositories/roome_repo.dart';

class GetProfileImageUseCase implements BaseUseCases<XFile?, ImageSource> {
  final RoomeRepo roomeRepo;

  const GetProfileImageUseCase({required this.roomeRepo});

  @override
  Future<Either<Failure, XFile?>> call(ImageSource params) async {
    return await roomeRepo.getProfileImage(source: params);
  }
}
