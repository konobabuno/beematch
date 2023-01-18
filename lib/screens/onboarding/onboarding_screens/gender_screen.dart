import 'package:beematch/config/theme.dart';
import 'package:beematch/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  final TabController tabController;
  const Gender({Key? key, required this.tabController}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 30),
        child: Column(
          children: [
            TextHead(tabController: tabController, color: AppTheme.green, colortext: AppTheme.primary, height: 52, width: 320, text: 'Te identificas como: '),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: CustomCheckBox(tabController: tabController, color: AppTheme.green, text: 'Hombre'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: CustomCheckBox(tabController: tabController, color: AppTheme.green, text: 'Mujer'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: CustomCheckBox(tabController: tabController, color: AppTheme.green, text: 'No binario'),
            ),
            const SizedBox(
              height: 30,
            ),
            TextHead(tabController: tabController, color: AppTheme.green, colortext: AppTheme.primary, height: 52, width: 200, text: 'Te atraen:'),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: CustomCheckBox(tabController: tabController, color: AppTheme.green, text: 'Hombre'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: CustomCheckBox(tabController: tabController, color: AppTheme.green, text: 'Mujer'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: CustomCheckBox(tabController: tabController, color: AppTheme.green, text: 'No binario'),
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