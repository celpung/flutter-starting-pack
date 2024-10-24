import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel(
      {required super.email, required super.password, required super.token});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'],
      password: json['password'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'token': token,
    };
  }
}
