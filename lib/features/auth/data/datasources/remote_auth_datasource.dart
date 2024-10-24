// data/datasources/remote_auth_datasource.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/errors/exceptions.dart';
import '../models/auth_model.dart';

class RemoteAuthDataSource {
  Future<AuthModel> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://api.example.com/login'),
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return AuthModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 500) {
      throw ServerException();
    } else {
      throw NetworkException();
    }
  }
}
