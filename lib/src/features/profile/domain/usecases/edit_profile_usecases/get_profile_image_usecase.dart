import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/profile/domain/repositories/edit_profile_repo.dart';

class GetProfileImageUseCase implements BaseUseCases<XFile?, ImageSource> {
  final EditProfileRepo editProfileRepo;

  const GetProfileImageUseCase({required this.editProfileRepo});

  @override
  Future<Either<Failure, XFile?>> call(ImageSource params) async {
    return await editProfileRepo.getProfileImage(source: params);
  }
}
