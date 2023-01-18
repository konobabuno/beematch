import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final TabController tabController;
  final String text;
  final Color color;
   
  const CustomCheckBox({Key? key, required this.tabController, required this.text, required this.color}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: false, 
          checkColor: color,
          activeColor: color,
          side: BorderSide(color: color),
          onChanged: (bool? newValue) {},

        ),
        Text(text, style: TextStyle(color: color, fontSize: 18),)
      ],
    );
  }
}