import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final TabController tabController;
  final String text;
  final Color color;
  final bool value;
  final Function (bool?)? onChanged;
   
  const  CustomCheckBox({
    Key? key, 
    required this.tabController, 
    required this.text,
    required this.value,
    required this.onChanged, 
    required this.color}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value, 
          checkColor: color,
          activeColor: color,
          side: BorderSide(color: color),
          onChanged: onChanged,
        ),
        Text(text, style: TextStyle(color: color, fontSize: 18),)
      ],
    );
  }
}