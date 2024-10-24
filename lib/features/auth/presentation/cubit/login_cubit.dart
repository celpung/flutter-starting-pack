// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'login_state.dart';

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial());

//   void setEmail(String email) {
//     emit(LoginLoaded(
//         email: email,
//         password: state.password,
//         isPasswordVisible: state.isPasswordVisible));
//   }

//   void setPassword(String password) {
//     emit(LoginLoaded(
//         email: state.email,
//         password: password,
//         isPasswordVisible: state.isPasswordVisible));
//   }

//   void togglePasswordVisibility() {
//     emit(LoginLoaded(
//         email: state.email,
//         password: state.password,
//         isPasswordVisible: !state.isPasswordVisible));
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit(this.authRepository) : super(LoginInitial());

  void setEmail(String email) {
    emit(LoginLoaded(
        email: email,
        password: state.password,
        isPasswordVisible: state.isPasswordVisible,
        message: state.message));
  }

  void setPassword(String password) {
    emit(LoginLoaded(
        email: state.email,
        password: password,
        isPasswordVisible: state.isPasswordVisible,
        message: state.message));
  }

  void togglePasswordVisibility() {
    emit(LoginLoaded(
        email: state.email,
        password: state.password,
        isPasswordVisible: !state.isPasswordVisible,
        message: state.message));
  }

  Future<void> login() async {
    emit(LoginLoading());

    final Either<Failure, AuthEntity> result = await authRepository.login(
      state.email,
      state.password,
    );

    result.fold(
      (failure) {
        // Handle the failure state
        emit(LoginFailure(message: _mapFailureToMessage(failure)));
      },
      (authEntity) {
        // Handle the success state
        emit(LoginSuccess(authEntity: authEntity));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server error occurred. Please try again later.';
      case NetworkFailure:
        return 'No Internet Connection. Please check your network.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}
