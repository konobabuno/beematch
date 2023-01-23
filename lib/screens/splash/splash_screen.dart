import 'dart:async';

import 'package:beematch/blocs/blocs.dart';
import 'package:beematch/config/app_router.dart';
import 'package:beematch/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print('Listener:');
          if (state.status == AuthStatus.unauthenticated) {
            Timer(
                const Duration(seconds: 2),
                () => Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.onBoardingRoute,
                    ModalRoute.withName('/onboarding')));
          } else if (state.status == AuthStatus.authenticated) {
            Timer(
                const Duration(seconds: 2),
                () => Navigator.of(context).pushNamed(
                      AppRoutes.initialRoute,
                    ));
          }
        },
        child: const Scaffold(
          backgroundColor: AppTheme.primary,
          body: Center(
            child: Text(
              'BeeMatch',
              style: TextStyle(
                  color: AppTheme.pink,
                  fontWeight: FontWeight.w900,
                  fontSize: 50),
            ),
          ),
        ),
      ),
    );
  }
}
