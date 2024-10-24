import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starting_pack/core/themes/app_colors.dart';
import 'package:flutter_starting_pack/features/auth/presentation/cubit/login_cubit.dart';
import 'package:flutter_starting_pack/features/home/presentation/pages/home_page.dart';
import 'package:flutter_starting_pack/features/sample.dart';

import 'features/auth/data/datasources/remote_auth_datasource.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteDataSource = RemoteAuthDataSource();
    final authRepository = AuthRepositoryImpl(remoteDataSource);
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(authRepository),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.background,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const SamplePage(),
            '/login': (context) => const LoginPage(),
            '/home': (context) => const HomePage(),
          },
        ));
  }
}
