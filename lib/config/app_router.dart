import 'package:beematch/blocs/blocs.dart';
import 'package:beematch/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static const matchesRoute = 'matches';
  static const yoRoute = 'yo';
  static const swipesRoute = 'swipes';
  static const chatRoute = 'chat';
  static const onBoardingRoute = 'onboarding';
  static const splashRoute = 'splash';
  static const loginRoute = 'login';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    appRoutes
        .addAll({'matches': (BuildContext context) => const MatchesScreen()});
    appRoutes.addAll({
      'yo': (BuildContext context) =>
          BlocProvider.of<AuthBloc>(context).state.status ==
                  AuthStatus.unauthenticated
              ? LoginScreen()
              : YoScreen()
    });
    appRoutes.addAll({'chat': (BuildContext context) => const ChatScreen()});
    appRoutes.addAll(
        {'onboarding': (BuildContext context) => const OnBoardingScreen()});
    appRoutes.addAll({
      'login': (BuildContext context) =>
          BlocProvider.of<AuthBloc>(context).state.status ==
                  AuthStatus.unauthenticated
              ? LoginScreen()
              : HomeScreen()
    });
    appRoutes
        .addAll({'splash': (BuildContext context) => const SplashScreen()});

    return appRoutes;
  }
}
