import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/roome/domain/entities/user_params.dart';
import 'package:roome/src/features/roome/domain/repositories/favorite_repo.dart';

class GetFavoritesUseCase implements BaseUseCases<dynamic, UserParams> {
  final FavoriteRepo favoriteRepo;

  const GetFavoritesUseCase({required this.favoriteRepo});

  @override
  Future<Either<Failure, dynamic>> call(UserParams params) async {
    return await favoriteRepo.getFavorites(userId: params.id!);
  }
}
