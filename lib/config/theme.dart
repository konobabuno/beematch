import 'package:flutter/material.dart';

class AppTheme{
  static const Color primary = Color(0xFF23252C);
  static const Color purple = Color(0xFF7000FF);
  static const Color yellow = Color(0xFFFFED46);
  static const Color pink = Color(0xFFFA80F4);
  static const Color green = Color(0xFF02FFA4);
  static final ThemeData theme = ThemeData(
      primaryColor: primary,
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      fontFamily: 'Raleway',
      scaffoldBackgroundColor: primary,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: purple,
              shape: const StadiumBorder(),
              fixedSize: const Size(200,50),
              textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Raleway'),
              elevation: 0)),
              );
}