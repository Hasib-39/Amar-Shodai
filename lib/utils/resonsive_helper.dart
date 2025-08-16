import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tab;
  final Widget desktop;
  const ResponsiveWidget({super.key, required this.mobile, required this.tab, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth < 768){
        return mobile;
      } else if(constraints.maxWidth < 1024 && constraints.maxWidth >= 768){
        return tab;
      } else{
        return desktop;
      }
    });
  }
}
