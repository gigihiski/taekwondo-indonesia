import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/services/gallery/models/gallery.dart';

class GalleryCategoryItem extends StatelessWidget {
  const GalleryCategoryItem({super.key, required this.category});

  final GalleryCategory category;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 209,
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(category.imageUrl ?? ""),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withAlpha(100),
              BlendMode.darken,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: AppTextH4SemiBold(text: category.name, color: Colors.white),
        ),
      ),
    );
  }
}
