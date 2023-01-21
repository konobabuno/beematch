import 'package:beematch/config/theme.dart';
import 'package:beematch/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Verification extends StatelessWidget {
  
  final TabController tabController;
  const Verification({Key? key, required this.tabController}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      backgroundColor: AppTheme.green,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 30),
        child: Column(
          children: [
            TextHead(tabController: tabController, color: AppTheme.primary, colortext: AppTheme.green, height: 100, width: 320, text: '¿Cuál fue tu código de verificación?'),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              child: CustomTextField(tabController: tabController, color: const Color.fromARGB(191, 35, 37, 44), text: 'Escribe tu código aquí', colortext: AppTheme.primary, controller: controller,)
              ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(tabController: tabController, color: AppTheme.purple, colortext: Colors.white, text: 'Enviar')
              )
            )
          ],
        ),
      )
    );
  }
}