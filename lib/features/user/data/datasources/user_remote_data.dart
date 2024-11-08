// This file defines UserRemoteDataSource, which communicates with the backend
// API to handle user registration. It uses the Dio package to send a POST request
// with user data in JSON format to the backend endpoint.

import 'package:dio/dio.dart';
import '../../core/base_url/base_url.dart';

import '../models/user_model.dart';

class UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSource(this.dio);

  // Sends a POST request to the backend to register a user
  Future<void> registerUser(RegisterModel register) async {
    await dio.post(
      '${BaseUrl.baseUrl}/register',
      data: register.toJson(),
    );
  }

  Future<void> loginUser(LoginModel login) async {
    await dio.post(
      '${BaseUrl.baseUrl}/login',
      data: login.toJson(),
    );
  }
}
