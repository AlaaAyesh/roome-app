import 'package:dartz/dartz.dart';
import 'package:roome/src/core/entities/no_params.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/home/domain/repositories/hotels_repo.dart';

class GetHotelsUseCase implements BaseUseCases<dynamic, NoParams> {
  final HotelsRepo hotelsRepo;

  const GetHotelsUseCase({required this.hotelsRepo});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) async {
    return await hotelsRepo.getHotels();
  }
}
