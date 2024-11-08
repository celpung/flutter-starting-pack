// This file defines the RegisterUserUseCase. It encapsulates the registration
// operation for a user, ensuring business logic is handled here.
// The use case layer interacts with the repository to initiate registration.

import '..//entities/login_entity.dart';
import '../entities/register_entity.dart';
import '../repositories/user_repository.dart';

class UserUseCase {
  final UserRepository repository;

  UserUseCase(this.repository);

  Future<void> register(Register register) async {
    await repository.registerUser(register);
  }

  Future<void> login(Login login) async {
    await repository.loginUser(login);
  }
}
