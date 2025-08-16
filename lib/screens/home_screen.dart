import 'package:amar_shodai/widgets/home_screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../utils/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeScreenHeader(),
          Expanded(
            child: ListView.builder(itemCount: 100,itemBuilder: (context, index){
              return Text("hello");
            }),
          ),
        ],
      ),
    );
  }
}