import 'package:beematch/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';
import '../widgets/widgets.dart';

class Place extends StatelessWidget {
  final TabController tabController;
  const Place({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading){
          return const Center(child: CircularProgressIndicator());
        }
        if (state is OnboardingLoaded){
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 30),
            child: Column(
              children: [
                TextHead(
                    tabController: tabController,
                    color: AppTheme.green,
                    colortext: AppTheme.primary,
                    height: 100,
                    width: 320,
                    text: 'Escribe el código de la fiesta.'),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 50),
                    child: CustomTextField(
                      tabController: tabController,
                      color: const Color.fromARGB(154, 2, 255, 162),
                      text: 'Escribe aquí el código',
                      colortext: AppTheme.green,
                      controller: controller,
                      onChanged: (value) {
                        context.read<OnboardingBloc>().add(
                            UpdateUser(user: state.user.copyWith(location: value)));
                      },
                    )),
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
