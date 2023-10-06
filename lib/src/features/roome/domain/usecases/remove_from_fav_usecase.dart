import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/roome/domain/entities/fav_change_params.dart';
import 'package:roome/src/features/roome/domain/repositories/room_repo.dart';

class RemoveFromFavUseCase implements BaseUseCases<dynamic, FavChangeParams> {
  final RoomRepo roomRepo;

  const RemoveFromFavUseCase({required this.roomRepo});

  @override
  Future<Either<Failure, dynamic>> call(FavChangeParams params) async {
    return await roomRepo.removeFromFav(
      uId: params.uId,
      hotelId: params.hotelId,
    );
  }
}
