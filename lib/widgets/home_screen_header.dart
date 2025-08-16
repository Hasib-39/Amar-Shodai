import 'package:amar_shodai/utils/resonsive_helper.dart';
import 'package:amar_shodai/widgets/category_drop_down.dart';
import 'package:flutter/material.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex:1,child: Image.asset(height: 56, "assets/images/logo.png")),
          SizedBox(width: 8,),
          ResponsiveWidget(
            mobile: SizedBox(width: 1,),
            tab: Expanded(flex: 1,child: CategoryDropdown()),
            desktop: Expanded(flex: 1,child: CategoryDropdown()),
          ),

          Expanded(flex: 1,child: ElevatedButton(onPressed: (){}, child: Row()))
        ],
      ),
    );
  }

}