import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../widgets/widgets.dart';

class Email extends StatelessWidget {

  final TabController tabController;
  const Email({Key? key, required this.tabController}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 30),
        child: Column(
          children: [
            TextHead(tabController: tabController, color: AppTheme.green, colortext: AppTheme.primary, height: 52, width: 320, text: '¿Cuál es tu email?'),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              child: CustomTextField(tabController: tabController, color: const Color.fromARGB(154, 2, 255, 162), text: 'Escribe tu email aquí', colortext: AppTheme.green,)
              ),
            const Text('A continuación te mandaremos un código de verificación a tu correo que utilizaremos para verificarte.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),),
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

