// This file defines RegisterModel, which maps the User entity to a format suitable
// for API requests. It handles JSON serialization, allowing seamless data
// exchange with the backend.
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/register_entity.dart';

class RegisterModel extends Register {
  RegisterModel({
    super.id,
    required super.name,
    required super.email,
    required super.nik,
    required super.phone,
    required super.password,
    super.photo,
    required super.address,
  });

  // Converts RegisterModel to JSON format for backend requests
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "nik": nik,
      "phone": phone,
      "password": password,
      "photo": photo,
      "address": address,
    };
  }
}

class LoginModel extends Login {
  LoginModel({
    required super.email,
    required super.password,
  });

  // Converts RegisterModel to JSON format for backend requests
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}



// // This file defines RegisterModel, which maps the User entity to a format suitable
// // for API requests. It handles JSON serialization, allowing seamless data
// // exchange with the backend.

// import '../../domain/entities/register_entity.dart';

// class RegisterModel extends Register {
//   RegisterModel({
//     int? id,
//     required String name,
//     required String email,
//     required String nik,
//     required String phone,
//     required String password,
//     String? photo,
//     required String address,
//   }) : super(
//           id: id,
//           name: name,
//           email: email,
//           nik: nik,
//           phone: phone,
//           password: password,
//           photo: photo,
//           address: address,
//         );

//   // Converts RegisterModel to JSON format for backend requests
//   Map<String, dynamic> toJson() {
//     return {
//       "name": name,
//       "email": email,
//       "nik": nik,
//       "phone": phone,
//       "password": password,
//       "photo": photo,
//       "address": address,
//     };
//   }
// }

