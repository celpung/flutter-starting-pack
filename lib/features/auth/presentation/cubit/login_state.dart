// part of 'login_cubit.dart';

// @immutable
// abstract class LoginState {
//   final String email;
//   final String password;
//   final bool isPasswordVisible;

//   const LoginState(
//       {this.email = '', this.password = '', this.isPasswordVisible = false});
// }

// class LoginInitial extends LoginState {}

// class LoginLoaded extends LoginState {
//   const LoginLoaded(
//       {required super.email,
//       required super.password,
//       required super.isPasswordVisible});
// }

part of 'login_cubit.dart';

abstract class LoginState {
  final String email;
  final String password;
  final bool isPasswordVisible;
  final String message;

  const LoginState({
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.message = '',
  });
}

class LoginInitial extends LoginState {}

class LoginLoaded extends LoginState {
  const LoginLoaded({
    required String email,
    required String password,
    required bool isPasswordVisible,
    required String message,
  }) : super(
          email: email,
          password: password,
          isPasswordVisible: isPasswordVisible,
          message: message,
        );
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final AuthEntity authEntity;

  const LoginSuccess({required this.authEntity});
}

class LoginFailure extends LoginState {
  final String message;

  const LoginFailure({required this.message});
}
