// This file defines the UserRepository contract. It specifies the operations
// related to user registration that the data layer must implement.
// This allows the use case layer to interact with the repository without
// knowing the data source details.

import '../entities/login_entity.dart';
import '../entities/register_entity.dart';

abstract class UserRepository {
  Future<void> registerUser(Register register);
  Future<void> loginUser(Login login);
}
