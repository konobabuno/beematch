import 'package:beematch/config/app_router.dart';
import 'package:beematch/config/theme.dart';
import 'package:beematch/cubits/signup/signup_cubit.dart';
import 'cubits/login/login_cubit.dart';
import 'repositories/repositories.dart';

import 'package:beematch/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/blocs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => StorageRepository(),
        ),
        RepositoryProvider(
          create: (context) => DatabaseRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
              databaseRepository: context.read<DatabaseRepository>(),
            ),
          ),
          BlocProvider<SignupCubit>(
            create: (context) =>
                SignupCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<LoginCubit>(
            create: (context) =>
                LoginCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<OnboardingBloc>(
            create: (context) => OnboardingBloc(
              databaseRepository: context.read<DatabaseRepository>(),
              storageRepository: context.read<StorageRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => SwipeBloc(
              authBloc: BlocProvider.of<AuthBloc>(context),
              databaseRepository: context.read<DatabaseRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => ProfileBloc(
              authBloc: BlocProvider.of<AuthBloc>(context),
              databaseRepository: context.read<DatabaseRepository>(),
            )..add(
                LoadProfile(
                    userId: context.read<AuthBloc>().state.authUser!.uid),
              ),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splashRoute,
          routes: AppRoutes.getAppRoutes(),
          theme: AppTheme.theme,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
