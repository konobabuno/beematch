import 'package:beematch/cubits/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/theme.dart';
import '../widgets/widgets.dart';

class Email extends StatelessWidget {
  final TabController tabController;
  const Email({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 90.0, horizontal: 30),
                child: Column(
                  children: [
                    TextHead(
                        tabController: tabController,
                        color: AppTheme.green,
                        colortext: AppTheme.primary,
                        height: 52,
                        width: 320,
                        text: '¿Cuál es tu email?'),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 50),
                        child: CustomTextField(
                          tabController: tabController,
                          color: const Color.fromARGB(154, 2, 255, 162),
                          text: 'Escribe tu email aquí',
                          onChanged: (value) {
                            context.read<SignupCubit>().emailChanged(value);
                            print(state.email);
                          },
                          colortext: AppTheme.green,
                        )),
                    TextHead(
                        tabController: tabController,
                        color: AppTheme.green,
                        colortext: AppTheme.primary,
                        height: 90,
                        width: 320,
                        text: 'Escribe una contraseña'),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 50),
                        child: CustomTextField(
                          tabController: tabController,
                          color: const Color.fromARGB(154, 2, 255, 162),
                          text: 'Escribe tu contraseña aquí',
                          onChanged: (value) {
                            context.read<SignupCubit>().passwordChanged(value);
                            print(state.password);
                          },
                          colortext: AppTheme.green,
                        )),
                    Container(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                          tabController: tabController,
                          color: AppTheme.purple,
                          colortext: Colors.white,
                          text: 'Enviar',
                        ))
                  ],
                ),
              ),
            );
          },
        ));
  }
}
