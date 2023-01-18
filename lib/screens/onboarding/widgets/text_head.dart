import 'package:flutter/material.dart';

class TextHead extends StatelessWidget {
  final TabController tabController;
  final double height;
  final double width;
  final Color color;
  final Color colortext;
  final String text;

  const TextHead({
    Key? key, required this.height, required this.width, required this.color, required this.text, required this.tabController, required this.colortext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Text(
        text, 
        textAlign: TextAlign.center,
        style: TextStyle(
          color: colortext, 
          fontWeight: FontWeight.w700,
          fontSize: 30,
        ),
      ),
    );
  }
}