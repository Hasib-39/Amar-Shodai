import 'package:amar_shodai/utils/resonsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:amar_shodai/utils/theme.dart';

class CategoryDropdown extends StatefulWidget {
  const CategoryDropdown({super.key});

  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  final List<String> categories = [
    "Fish & Seafood",
    "Steaks & Fillets",
    "Chicken & Duck",
    "Beef & Mutton",
    "Combo Pack",
    "Dried Fish",
    "Marinated & Cooked",
    "Pasta & Spice",
  ];

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: StatefulBuilder(
        builder: (context, setStateSB) {
          return PopupMenuButton<String>(
            onOpened: () => setStateSB(() => isOpen = true),
            onCanceled: () => setStateSB(() => isOpen = false),
            onSelected: (String value) {
              setStateSB(() => isOpen = false);
              // TODO: apply sorting/filtering using `value`
            },
            itemBuilder: (BuildContext context) {
              return categories.map((String category) {
                return PopupMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList();
            },
            child: Container(
              constraints: const BoxConstraints(maxWidth: 280),
              decoration: BoxDecoration(
                color: lightMode.primaryColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.menu, color: Colors.white,),
                    const SizedBox(width: 8),
                    Text("Browse Categories", style: lightMode.textTheme.labelSmall,),
                    const SizedBox(width: 8),
                    Icon(isOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down, color: Colors.white,),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
