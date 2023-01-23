
import 'package:beematch/config/app_router.dart';
import 'package:beematch/config/theme.dart';
import 'repositories/repositories.dart';

import 'package:beematch/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/blocs.dart';
import 'models/models.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_)=> AuthRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_)=>AuthBloc(
            authRepository: context.read<AuthRepository>(),
            ),
          ),
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
      ),
    );

  }
}

