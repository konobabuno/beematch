import 'package:beematch/config/theme.dart';
import 'package:beematch/screens/onboarding/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Start extends StatelessWidget {
  final TabController tabController;
  const Start({Key? key, required this.tabController}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 30),
        child: Column(
          children: [
            const Text(
              'Bienvenido a BeeMatch', 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.pink, 
                fontWeight: FontWeight.w900,
                fontSize: 40,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 300,
              width: 300,
              child: SvgPicture.asset('assets/initial.svg'),
            ),
            const Text(
              '!Hola Abeja!\nEsta App está hecha por y para estudiantes, por esta razón, te pedimos que seas responsable y sobre todo que te diviertas usandola.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(tabController: tabController, color: AppTheme.purple, colortext: Colors.white, text: 'Iniciar')
              )
            )
          ],
        ),
      )
    );
  }
}