import 'package:beematch/config/theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TabController tabController;
  final String text;
  final Color color;
  final Color colortext;
  final TextEditingController? controller;
  final Function(String)? onChanged;
   
  const CustomTextField({Key? key, required this.tabController, required this.text, required this.color, required this.colortext, this.controller, this.onChanged}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: colortext),
      decoration: InputDecoration(
        filled: true, 
        fillColor: Colors.transparent,
        hintText: text,
        contentPadding: const EdgeInsets.all(20.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colortext),
          borderRadius: BorderRadius.circular(20)
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(20)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppTheme.purple),
          borderRadius: BorderRadius.circular(20)
        ),
        focusColor: colortext,
        labelStyle: TextStyle(color: colortext),
        hintStyle: TextStyle(color: color),
      ),
      onChanged: onChanged,
    );
  }
}