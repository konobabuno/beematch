import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;
  final Color color;
  final Color colortext;

  const CustomButton({super.key, required this.tabController, required this.color, required this.colortext, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:() {
        tabController.animateTo(tabController.index + 1);
      },
      style: ElevatedButton.styleFrom(
              backgroundColor: color
      ), 
      child: Text(text, style: TextStyle(color: colortext),),
    );
  }
}