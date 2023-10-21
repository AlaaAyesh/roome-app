class EndPoints {
  static const String host = 'http://192.168.1.9:7070/';
  static const String baseUrl = '${host}api/';
  static const String imageBaseUrl = '${baseUrl}images/';
  static const String iconBaseUrl = '${baseUrl}icons/';
  static const String user = '${baseUrl}user';
  static const String login = '${baseUrl}auth/login';
  static const String register = '${baseUrl}auth/register';
  static const String role = '${baseUrl}role';
  static const String hotel = '${baseUrl}hotel';
  static const String hotelSearch = '${baseUrl}hotel/search/';
  static const String favorite = '$user/fav/';
  static const String nearMe = '$user/near-hotels/';
  static const String recommended = '$user/recommended-hotels/';
}
