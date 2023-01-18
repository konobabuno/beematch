import 'package:beematch/config/app_router.dart';
import 'package:beematch/config/theme.dart';
import 'package:beematch/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/blocs.dart';
import 'models/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SwipeBloc()..add(LoadUsers(users: User.users)),
        ),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoardingRoute,
      routes: AppRoutes.getAppRoutes(),
      theme: AppTheme.theme,
      home: const HomeScreen(),
      ),
    );

  }
}

