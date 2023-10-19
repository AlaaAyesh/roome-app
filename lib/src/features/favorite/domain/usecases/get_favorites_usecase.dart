import 'package:dartz/dartz.dart';

import '/src/core/errors/failure.dart';
import '/src/core/usecases/base_usecase.dart';
import '/src/features/favorite/domain/repositories/favorite_repo.dart';

class GetFavoritesUseCase implements BaseUseCases<dynamic, int> {
  final FavoriteRepo favoriteRepo;

  const GetFavoritesUseCase({required this.favoriteRepo});

  @override
  Future<Either<Failure, dynamic>> call(int? params) async {
    return await favoriteRepo.getFavorites(userId: params!);
  }
}
