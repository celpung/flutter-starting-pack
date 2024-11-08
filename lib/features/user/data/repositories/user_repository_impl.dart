// This file implements the UserRepository interface, fulfilling registration
// requirements. It interacts with the data source (UserRemoteDataSource) to
// register a user, while the domain layer remains unaware of API details.

import '../../domain/entities/login_entity.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_data.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> registerUser(Register user) async {
    final userModel = RegisterModel(
      name: user.name,
      email: user.email,
      nik: user.nik,
      phone: user.phone,
      password: user.password,
      photo: user.photo,
      address: user.address,
    );
    await remoteDataSource.registerUser(userModel);
  }

  @override
  Future<void> loginUser(Login login) {
    throw UnimplementedError();
  }
}
