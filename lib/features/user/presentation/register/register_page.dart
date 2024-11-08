// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_input.dart';
import '../../../../core/widgets/app_textarea.dart';
import '../../../../core/widgets/loading.dart';
import 'cubit/register_cubit.dart';
import '../../domain/entities/register_entity.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    nikController.dispose();
    phoneController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => const LoadingWidget(),
            );
          } else if (state is RegisterSuccess) {
            Navigator.of(context).pop();
            Navigator.pushReplacementNamed(context, "/login");
          } else {
            Navigator.of(context).pop();
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
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
                    'REGISTRASI',
                    style: AppTextStyles.h1(context),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Jika belum mempunyai akun.',
                    style: AppTextStyles.bodyText(context),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  AppTextInput(
                    controller: nameController,
                    hintText: 'Masukkan nama',
                    rightIcon: const Icon(Icons.people_alt_outlined),
                  ),
                  const SizedBox(height: 20),
                  AppTextInput(
                    controller: emailController,
                    hintText: 'Masukkan email',
                    rightIcon: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(height: 20),
                  AppTextInput(
                    controller: nikController,
                    hintText: 'Masukkan NIK',
                    rightIcon: const Icon(Icons.card_membership_outlined),
                  ),
                  const SizedBox(height: 20),
                  AppTextInput(
                    controller: phoneController,
                    hintText: 'Masukkan No. Telepon',
                    rightIcon: const Icon(Icons.phone_android_outlined),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextArea(
                    controller: addressController,
                    hintText: "Masukkan alamat",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextInput(
                    isPassword: true,
                    controller: passwordController,
                    hintText: 'Masukkan password',
                    rightIcon: const Icon(Icons.visibility),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextInput(
                    isPassword: true,
                    controller: confirmPasswordController,
                    hintText: 'Ulangi password',
                    rightIcon: const Icon(Icons.visibility),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AppButton(
                    text: "DAFTAR",
                    type: ButtonType.primary,
                    onPressed: () {
                      final user = Register(
                        name: nameController.text,
                        email: emailController.text,
                        nik: nikController.text,
                        phone: phoneController.text,
                        password: passwordController.text,
                        address: addressController.text,
                      );

                      context.read<RegisterCubit>().registerUser(user);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    child: Text(
                      "Login jika sudah punya akun",
                      style: AppTextStyles.bodyText(context)
                          .copyWith(color: AppColors.primary),
                    ),
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
