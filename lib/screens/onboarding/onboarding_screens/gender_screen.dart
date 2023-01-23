import 'package:beematch/config/theme.dart';
import 'package:beematch/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';

class Gender extends StatelessWidget {
  final TabController tabController;
  const Gender({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is OnboardingLoaded) {
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 30),
            child: Column(
              children: [
                TextHead(
                    tabController: tabController,
                    color: AppTheme.green,
                    colortext: AppTheme.primary,
                    height: 52,
                    width: 320,
                    text: 'Te identificas como: '),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CustomCheckBox(
                    tabController: tabController,
                    color: AppTheme.green,
                    text: 'Hombre',
                    value: state.user.gender == 'Hombre',
                    onChanged: (bool? newValue) {
                      context.read<OnboardingBloc>().add(UpdateUser(
                          user: state.user.copyWith(gender: 'Hombre')));
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CustomCheckBox(
                    tabController: tabController,
                    color: AppTheme.green,
                    text: 'Mujer',
                    value: state.user.gender == 'Mujer',
                    onChanged: (bool? newValue) {
                      context.read<OnboardingBloc>().add(UpdateUser(
                          user: state.user.copyWith(gender: 'Mujer')));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TextHead(
                      tabController: tabController,
                      color: AppTheme.green,
                      colortext: AppTheme.primary,
                      height: 52,
                      width: 200,
                      text: 'Te atraen:'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CustomCheckBox(
                    tabController: tabController,
                    color: AppTheme.green,
                    text: 'Hombres',
                    value: state.user.find == 'Hombres',
                    onChanged: (bool? newValue) {
                      context.read<OnboardingBloc>().add(UpdateUser(
                          user: state.user.copyWith(find: 'Hombres')));
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CustomCheckBox(
                    tabController: tabController,
                    color: AppTheme.green,
                    text: 'Mujeres',
                    value: state.user.find == 'Mujeres',
                    onChanged: (bool? newValue) {
                      context.read<OnboardingBloc>().add(UpdateUser(
                          user: state.user.copyWith(find: 'Mujeres')));
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CustomCheckBox(
                    tabController: tabController,
                    color: AppTheme.green,
                    text: 'Ambos',
                    value: state.user.find == 'Ambos',
                    onChanged: (bool? newValue) {
                      context.read<OnboardingBloc>().add(
                          UpdateUser(user: state.user.copyWith(find: 'Ambos')));
                    },
                  ),
                ),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                            tabController: tabController,
                            color: AppTheme.purple,
                            colortext: Colors.white,
                            text: 'Enviar')))
              ],
            ),
          ));
        } else {
          return const Text('Algo salió mal');
        }
      },
    );
  }
}
