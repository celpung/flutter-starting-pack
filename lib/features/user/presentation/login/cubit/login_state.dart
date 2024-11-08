part of 'login_cubit.dart';

abstract class LoginState {
  final bool isPasswordVisible;

  LoginState({this.isPasswordVisible = false});
}

class LoginInitial extends LoginState {
  LoginInitial() : super(isPasswordVisible: false);
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}
