import 'package:beematch/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';
import '../widgets/widgets.dart';

class Question extends StatelessWidget {
  final TabController tabController;
  const Question({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is OnboardingLoaded) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 90.0, horizontal: 30),
              child: Column(
                children: [
                  TextHead(
                      tabController: tabController,
                      color: AppTheme.green,
                      colortext: AppTheme.primary,
                      height: 100,
                      width: 320,
                      text: 'Escribe tu frase para ligar.'),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      child: CustomTextField(
                        tabController: tabController,
                        color: const Color.fromARGB(154, 2, 255, 162),
                        text: 'Escribe aquí tu frase',
                        colortext: AppTheme.green,
                        controller: controller,
                        onChanged: (value) {
                          context.read<OnboardingBloc>().add(UpdateUser(
                              user: state.user.copyWith(question: value)));
                        },
                      )),
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: const Text(
                      'Escribe una frase para poder jugar con tu match, si no tienes ninguna escribe no se:(',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppTheme.green,
                          fontFamily: 'Poppins',
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomButton(
                              tabController: tabController,
                              color: AppTheme.purple,
                              colortext: Colors.white,
                              text: 'Enviar')))
                ],
              ),
            ),
          ));
        } else {
          return const Text('Algo salió mal');
        }
      },
    );
  }
}
