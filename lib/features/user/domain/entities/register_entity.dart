// This file defines the User entity, which represents the user data structure
// for the app's business logic layer. It includes essential user properties
// for registration, such as name, email, phone, etc.

class Register {
  final int? id;
  final String name;
  final String email;
  final String nik;
  final String phone;
  final String password;
  final String? photo;
  final String address;

  Register({
    this.id,
    required this.name,
    required this.email,
    required this.nik,
    required this.phone,
    required this.password,
    this.photo,
    required this.address,
  });
}
