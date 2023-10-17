class EndPoints {
  static const String baseUrl = 'http://192.168.1.9:7070/api/';
  static const String imageBaseUrl = 'http://192.168.1.9:7070/api/images/';
  static const String iconBaseUrl = 'http://192.168.1.9:7070/api/icons/';
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
