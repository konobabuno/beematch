import 'package:beematch/config/theme.dart';
import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton(
      {super.key,
      required this.text,
      required this.color,
      required this.colortext,
      this.onPressed});

  final String text;
  final Color color;
  final Color colortext;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: AppTheme.purple),
        child: Text(
          text,
          style: TextStyle(color: colortext),
        ));
  }
}
