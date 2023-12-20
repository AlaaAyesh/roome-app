import 'package:roome/src/features/favorite/domain/entities/fav_params.dart';

abstract class FavoriteDataSource {
  Future<dynamic> getFavorites({required int userId});

  Future<dynamic> removeFromFav({required FavParams favParams});

  Future<dynamic> addToFav({required FavParams favParams});
}
