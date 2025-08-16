import 'package:flutter/material.dart';

import '../theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello world 1", style: lightMode.textTheme.titleLarge,),

      ),
    );
  }
}