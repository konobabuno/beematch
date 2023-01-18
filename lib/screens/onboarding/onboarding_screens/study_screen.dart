import 'package:beematch/config/theme.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class Study extends StatelessWidget {
  final TabController tabController;
  const Study({Key? key, required this.tabController}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 30),
        child: Column(
          children: [
            TextHead(tabController: tabController, color: AppTheme.green, colortext: AppTheme.primary, height: 100, width: 320, text: '¿Qué estas estudiando?'),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              child: CustomTextField(tabController: tabController, color: const Color.fromARGB(154, 2, 255, 162), text: 'Escribe tu carrera aquí', colortext: AppTheme.green,)
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