import 'package:beematch/config/theme.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class Pictures extends StatelessWidget {
  final TabController tabController;
  const Pictures({Key? key, required this.tabController}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.green,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 30),
        child: Align(
          child: Column(
            children: [
              TextHead(tabController: tabController, color: AppTheme.primary, colortext: AppTheme.green, height: 150, width: 350, text: 'Agrega al menos dos fotos para mostrarlas a los demás.'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomImageContainer(tabController: tabController),
                  CustomImageContainer(tabController: tabController),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomImageContainer(tabController: tabController),
                  CustomImageContainer(tabController: tabController),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(tabController: tabController, color: AppTheme.primary, colortext: AppTheme.yellow, text: 'Iniciar')
                )
              )
            ],
          ),
        ),
      )
    );
  }
}