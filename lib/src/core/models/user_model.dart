import 'package:roome/src/core/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    String? name,
    String? email,
    String? uId,
    String? password,
    String? image,
  }) : super(
          email: email,
          name: name,
          password: password,
          uId: uId,
          image: image,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'image': image,
    };
  }
}
