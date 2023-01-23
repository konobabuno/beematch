import 'package:beematch/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static const matchesRoute = 'matches';
  static const yoRoute = 'yo';
  static const swipesRoute = 'swipes';
  static const chatRoute = 'chat';
  static const onBoardingRoute = 'onboarding';
  static const splashRoute = 'splash';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
    appRoutes
        .addAll({'matches': (BuildContext context) => const MatchesScreen()});
    appRoutes.addAll({'yo': (BuildContext context) => const YoScreen()});
    appRoutes
        .addAll({'swipes': (BuildContext context) => const SwipesScreen()});
    appRoutes.addAll({'chat': (BuildContext context) => const ChatScreen()});
    appRoutes.addAll(
        {'onboarding': (BuildContext context) => const OnBoardingScreen()});
    appRoutes
        .addAll({'splash': (BuildContext context) => const SplashScreen()});

    return appRoutes;
  }
}
