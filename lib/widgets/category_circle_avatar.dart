import 'package:amar_shodai/utils/theme.dart';
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
            radius: 70,
            backgroundImage: AssetImage(widget.imagePath),
          ),
          if (isHovered)
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.6),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  widget.category,
                  textAlign: TextAlign.center,
                  style: lightMode.textTheme.labelMedium
                ),
              ),
            ),
        ],
      ),
    );
  }
}
