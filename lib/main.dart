import 'package:amar_shodai/screens/home_screen.dart';
import 'package:amar_shodai/theme/theme.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}



