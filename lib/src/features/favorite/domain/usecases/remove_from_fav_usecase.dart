import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/favorite/domain/entities/fav_params.dart';
import 'package:roome/src/features/favorite/domain/repositories/favorite_repo.dart';

class RemoveFromFavUseCase implements BaseUseCases<dynamic, FavParams> {
  final FavoriteRepo favoriteRepo;

  const RemoveFromFavUseCase({required this.favoriteRepo});

  @override
  Future<Either<Failure, dynamic>> call(FavParams params) async {
    return await favoriteRepo.removeFromFav(
      uId: params.uId,
      hotelId: params.hotelId,
    );
  }
}
