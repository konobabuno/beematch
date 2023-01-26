import 'package:beematch/config/app_router.dart';
import 'package:beematch/config/theme.dart';
import 'package:beematch/cubits/login/login_cubit.dart';
import 'package:beematch/screens/onboarding/widgets/widgets.dart';
import 'package:beematch/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Align(
              alignment: Alignment.center,
              child: TextHeadW(
                  color: AppTheme.green,
                  colortext: AppTheme.primary,
                  height: 52,
                  width: 200,
                  text: 'Login'),
            ),
            const SizedBox(height: 50),
            const EmailInput(),
            const SizedBox(height: 50),
            const PasswordInput(),
            const SizedBox(height: 50),
            CustomLoginButton(
              text: 'Login',
              color: AppTheme.purple,
              colortext: Colors.white,
              onPressed: () {
                context.read<LoginCubit>().logInWithCredentials();
              },
            ),
            const SizedBox(height: 50),
            CustomLoginButton(
              text: 'Registrarse',
              color: AppTheme.pink,
              colortext: Colors.white,
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.onBoardingRoute,
                ModalRoute.withName('/onboarding'),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          style: const TextStyle(color: AppTheme.green),
          onChanged: (email) {
            context.read<LoginCubit>().emailChanged(email);
          },
          decoration: InputDecoration(
            labelText: 'Email',
            filled: true,
            fillColor: Colors.transparent,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppTheme.green),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppTheme.purple),
                borderRadius: BorderRadius.circular(20)),
            focusColor: AppTheme.green,
            labelStyle: const TextStyle(color: AppTheme.green),
            hintStyle: const TextStyle(color: AppTheme.pink),
          ),
        );
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          style: const TextStyle(color: AppTheme.green),
          onChanged: (password) {
            context.read<LoginCubit>().passwordChanged(password);
          },
          decoration: InputDecoration(
            labelText: 'Password',
            filled: true,
            fillColor: Colors.transparent,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppTheme.green),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppTheme.purple),
                borderRadius: BorderRadius.circular(20)),
            focusColor: AppTheme.green,
            labelStyle: const TextStyle(color: AppTheme.green),
            hintStyle: const TextStyle(color: AppTheme.pink),
          ),
          obscureText: true,
        );
      },
    );
  }
}
