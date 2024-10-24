class AuthEntity {
  final String email;
  final String password;
  final String token;

  AuthEntity(
      {required this.email, required this.password, required this.token});
}
