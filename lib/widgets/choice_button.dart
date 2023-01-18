import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final String text;
  final Color colortext;
  



  const ChoiceButton(
    {
      super.key,
      required this.width,
      required this.height,
      required this.color,
      required this.text,
      required this.colortext,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(child: Text(text, style: TextStyle(color: colortext, fontWeight: FontWeight.bold, fontSize: 20),))
    );
  }
}

