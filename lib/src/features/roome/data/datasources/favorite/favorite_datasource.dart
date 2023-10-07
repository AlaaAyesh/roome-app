abstract class FavoriteDataSource {
  Future<dynamic> getFavorites({required int userId});

  Future<dynamic> removeFromFav({
    required int uId,
    required int hotelId,
  });

  Future<dynamic> addToFav({
    required int uId,
    required int hotelId,
  });
}
