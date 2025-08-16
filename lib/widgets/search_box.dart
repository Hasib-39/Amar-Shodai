import 'package:amar_shodai/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      constraints: const BoxConstraints(maxWidth: 300),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300), // border
        borderRadius: BorderRadius.circular(4), // rounded corners
      ),
      child: Row(
        children: [
          // Text field
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for products",
                hintStyle: GoogleFonts.robotoMono(
                  color: Colors.grey.shade600,
                  fontSize: 16,),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 14),
            ),
          ),

          // Search button with icon
          IconButton(
            onPressed: () {
              // TODO: implement search action
            },
            icon: const Icon(
              Icons.search,
              color: Color(0xFF40A944),
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
