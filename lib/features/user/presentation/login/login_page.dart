import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starting_pack/features/user/domain/entities/login_entity.dart';
import 'package:flutter_starting_pack/features/user/presentation/login/cubit/login_cubit.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_input.dart';
import '../../../../core/widgets/loading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => const LoadingWidget(),
          );
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: const Image(
                      image: AssetImage('assets/images/login_image.png'),
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
                  AppTextInput(
                    controller: emailController,
                    hintText: 'Masukkan email',
                    rightIcon: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(height: 20),
                  AppTextInput(
                    controller: passwordController,
                    isPassword: !isPasswordVisible,
                    hintText: 'Masukkan password',
                    rightIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  AppButton(
                    text: "MASUK",
                    type: ButtonType.primary,
                    onPressed: () {
                      final login = Login(
                        email: emailController.text,
                        password: passwordController.text,
                      );

                      context.read<LoginCubit>().loginUser(login);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/register");
                        },
                        child: Text(
                          "Registrasi",
                          style: AppTextStyles.bodyText(context).copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text("/"),
                      const SizedBox(width: 10),
                      GestureDetector(
                        child: Text(
                          "Lupa Password?",
                          style: AppTextStyles.bodyText(context).copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
