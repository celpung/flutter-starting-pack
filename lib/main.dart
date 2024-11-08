import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_starting_pack/core/themes/app_colors.dart';
import 'package:flutter_starting_pack/features/user/presentation/login/cubit/login_cubit.dart';
import 'package:flutter_starting_pack/features/user/presentation/login/login_page.dart';
import 'features/user/data/datasources/user_remote_data.dart';
import 'features/user/data/repositories/user_repository_impl.dart';
import 'features/user/domain/usecases/user_usecase.dart';
import 'features/user/presentation/register/cubit/register_cubit.dart';
import 'features/user/presentation/register/register_page.dart';

void main() {
  final dio = Dio();

  final userRemoteDataSource = UserRemoteDataSource(dio);
  final repository = UserRepositoryImpl(userRemoteDataSource);
  final registerUserUseCase = UserUseCase(repository);

  runApp(MyApp(registerUserUseCase));
}

class MyApp extends StatelessWidget {
  final UserUseCase userUseCase;

  const MyApp(this.userUseCase, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
      ),
      initialRoute: '/login',
      routes: {
        '/register': (context) => BlocProvider(
              create: (_) => RegisterCubit(userUseCase),
              child: const RegisterPage(),
            ),
        '/login': (context) => BlocProvider(
              create: (_) => LoginCubit(userUseCase),
              child: const LoginPage(),
            ),
      },
    );
  }
}
