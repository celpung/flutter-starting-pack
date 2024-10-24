import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starting_pack/features/auth/data/datasources/remote_auth_datasource.dart';
import 'package:flutter_starting_pack/features/auth/data/repositories/auth_repository_impl.dart';
import '../../../../core/themes/app_text.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_input.dart';
import '../cubit/login_cubit.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => LoginCubit(),
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height -
//                   AppBar().preferredSize.height,
//               width: double.infinity,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   const SizedBox(
//                     height: 30,
//                     child: Image(
//                       image: AssetImage('assets/images/icon.png'),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'SELAMAT DATANG',
//                     style: AppTextStyles.h1(context),
//                   ),
//                   Text(
//                     'Silahkan Masuk Ke Akun Anda',
//                     style: AppTextStyles.bodyText(context),
//                   ),
//                   const SizedBox(height: 50),

//                   // Email Input
//                   BlocBuilder<LoginCubit, LoginState>(
//                     builder: (context, state) {
//                       return AppTextInput(
//                         controller: TextEditingController(text: state.email),
//                         hintText: 'Masukkan email',
//                         rightIcon: const Icon(Icons.email_outlined),
//                         onChanged: (value) =>
//                             context.read<LoginCubit>().setEmail(value),
//                       );
//                     },
//                   ),

//                   const SizedBox(height: 20),

//                   // Password Input
//                   BlocBuilder<LoginCubit, LoginState>(
//                     builder: (context, state) {
//                       return AppTextInput(
//                         controller: TextEditingController(text: state.password),
//                         isPassword: !state.isPasswordVisible,
//                         hintText: 'Masukkan password',
//                         rightIcon: IconButton(
//                           icon: Icon(state.isPasswordVisible
//                               ? Icons.visibility
//                               : Icons.visibility_off),
//                           onPressed: () => context
//                               .read<LoginCubit>()
//                               .togglePasswordVisibility(),
//                         ),
//                         onChanged: (value) =>
//                             context.read<LoginCubit>().setPassword(value),
//                       );
//                     },
//                   ),

//                   const SizedBox(height: 50),

//                   // Login Button
//                   AppButton(
//                     text: "MASUK",
//                     type: ButtonType.primary,
//                     onPressed: () {
//                       final cubit = context.read<LoginCubit>();
//                       print("Email: ${cubit.state.email}");
//                       print("Password: ${cubit.state.password}");
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteDataSource = RemoteAuthDataSource();
    final authRepository = AuthRepositoryImpl(remoteDataSource);
    return BlocProvider(
      create: (_) => LoginCubit(authRepository),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                    child: Image(
                      image: AssetImage('assets/images/icon.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'SELAMAT DATANG',
                    style: AppTextStyles.h1(context),
                  ),
                  Text(
                    'Silahkan Masuk Ke Akun Anda',
                    style: AppTextStyles.bodyText(context),
                  ),
                  const SizedBox(height: 50),

                  // Email Input
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return AppTextInput(
                        controller: TextEditingController(text: state.email),
                        hintText: 'Masukkan email',
                        rightIcon: const Icon(Icons.email_outlined),
                        onChanged: (value) =>
                            context.read<LoginCubit>().setEmail(value),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Password Input
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return AppTextInput(
                        controller: TextEditingController(text: state.password),
                        isPassword: !state.isPasswordVisible,
                        hintText: 'Masukkan password',
                        rightIcon: IconButton(
                          icon: Icon(state.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () => context
                              .read<LoginCubit>()
                              .togglePasswordVisibility(),
                        ),
                        onChanged: (value) =>
                            context.read<LoginCubit>().setPassword(value),
                      );
                    },
                  ),

                  const SizedBox(height: 50),

                  // Handle Loading, Success, or Failure states
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        // Navigate on success
                        Navigator.pushReplacementNamed(context, '/home');
                      } else if (state is LoginFailure) {
                        // Show error message on failure
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message)),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const CircularProgressIndicator();
                      }

                      return AppButton(
                        text: "MASUK",
                        type: ButtonType.primary,
                        onPressed: () {
                          context.read<LoginCubit>().login();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
