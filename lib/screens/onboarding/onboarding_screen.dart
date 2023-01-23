import 'package:beematch/blocs/blocs.dart';
import 'package:beematch/cubits/signup/signup_cubit.dart';
import 'package:beematch/repositories/auth/auth_repository.dart';
import 'package:beematch/repositories/database/database_repository.dart';
import 'package:beematch/repositories/storage/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_screens/screens.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Start'),
    Tab(text: 'Email'),
    Tab(text: 'Verification'),
    Tab(text: 'Gender'),
    Tab(text: 'Info'),
    Tab(text: 'Study'),
    Tab(text: 'Pictures'),
    Tab(text: 'Question'),
    Tab(text: 'Place'),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupCubit>(
          create: (_) =>
              SignupCubit(authRepository: context.read<AuthRepository>()),
        ),
        BlocProvider<OnboardingBloc>(
          create: (_) => OnboardingBloc(
              databaseRepository: DatabaseRepository(),
              storageRepository: StorageRepository())
            ..add(
              StartOnboarding(),
            ),
        ),
      ],
      child: DefaultTabController(
        length: tabs.length,
        child: Builder(builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          return Scaffold(
            body: TabBarView(
              children: [
                Start(tabController: tabController),
                Email(tabController: tabController),
                Verification(tabController: tabController),
                Gender(tabController: tabController),
                Info(tabController: tabController),
                Study(tabController: tabController),
                Pictures(tabController: tabController),
                Question(tabController: tabController),
                Place(tabController: tabController),
              ],
            ),
          );
        }),
      ),
    );
  }
}
