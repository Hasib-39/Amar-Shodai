import 'package:flutter/material.dart';

class CategoryCircleAvatar extends StatefulWidget {
  final String imagePath;
  final String category;

  const CategoryCircleAvatar({
    super.key,
    required this.imagePath,
    required this.category,
  });

  @override
  State<CategoryCircleAvatar> createState() => _CategoryCircleAvatarState();
}

class _CategoryCircleAvatarState extends State<CategoryCircleAvatar> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(widget.imagePath),
          ),
          if (isHovered)
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  widget.category,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
