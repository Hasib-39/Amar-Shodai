import 'package:flutter/material.dart';
import 'package:amar_shodai/utils/theme.dart';

class CategoryDropdown extends StatefulWidget {
  final bool isTablet; // 👈 take isTablet from parent

  const CategoryDropdown({super.key, required this.isTablet});

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
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: StatefulBuilder(
        builder: (context, setStateSB) {
          return PopupMenuButton<String>(
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Color(0xffd1d5db), width: 1)
            ),
            position: PopupMenuPosition.under,
            onOpened: () => setStateSB(() => isOpen = true),
            onCanceled: () => setStateSB(() => isOpen = false),
            onSelected: (String value) {
              setStateSB(() => isOpen = false);
              // TODO: call sorting/filtering function with value
            },
            itemBuilder: (BuildContext context) {
              List<PopupMenuEntry<String>> items = [];
              for (int i = 0; i < categories.length; i++) {
                items.add(
                  PopupMenuItem<String>(
                    value: categories[i],
                    child: Text(categories[i], style: lightMode.textTheme.bodySmall?.copyWith(fontSize: 16)),
                  ),
                );
                if (i != categories.length - 1) {
                  items.add(const PopupMenuDivider(height: 1, color: Color(0xFFD1D5DB)));
                }
              }
              return items;
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 280),
                decoration: BoxDecoration(
                  color: Color(0xff8fc466),
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.menu, color: Colors.white),
                      const SizedBox(width: 8),
                      widget.isTablet
                          ? Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "BROWSE",
                            style: lightMode.textTheme.labelSmall
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            "CATEGORIES",
                            style: lightMode.textTheme.labelSmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      )
                          : Text(
                        "BROWSE CATEGORIES",
                        style: lightMode.textTheme.labelSmall,
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        isOpen
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
