import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: Colors.red.shade600,
      fontWeight: FontWeight.bold,
      fontFamily: "Roboto-Mono",
      fontSize: 24,
    )
  )
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
);