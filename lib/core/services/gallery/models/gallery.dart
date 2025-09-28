import 'dart:convert';
import 'package:taekwondo/core/models/meta.dart';

class GalleryCategoriesResponse {
  final Meta meta;
  final List<GalleryCategory> data;

  GalleryCategoriesResponse({required this.meta, required this.data});

  factory GalleryCategoriesResponse.fromJson(String str) =>
      GalleryCategoriesResponse.fromMap(json.decode(str));

  factory GalleryCategoriesResponse.fromMap(Map<String, dynamic> map) {
    return GalleryCategoriesResponse(
      meta: Meta.fromMap(map["meta"]),
      data: map['data'] != null
          ? List<GalleryCategory>.from(
              map['data'].map((x) => GalleryCategory.fromMap(x)),
            )
          : [],
    );
  }
}

class GalleriesResponse {
  final Meta meta;
  final List<Gallery> data;

  GalleriesResponse({required this.meta, required this.data});

  factory GalleriesResponse.fromJson(String str) =>
      GalleriesResponse.fromMap(json.decode(str));

  factory GalleriesResponse.fromMap(Map<String, dynamic> map) {
    return GalleriesResponse(
      meta: Meta.fromMap(map["meta"]),
      data: map['data'] != null
          ? List<Gallery>.from(map['data'].map((x) => Gallery.fromMap(x)))
          : [],
    );
  }
}

class Gallery {
  final String id;
  final String title;
  final String imageUrl;
  final String? description;
  final GalleryCategory? category;
  final DateTime? date;

  Gallery({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.description,
    this.category,
    this.date,
  });

  String toJson() => json.encode(toMap());

  factory Gallery.fromJson(String str) => Gallery.fromMap(json.decode(str));

  factory Gallery.fromMap(Map<String, dynamic> map) => Gallery(
    id: map['id'],
    title: map['title'],
    description: map['description'],
    imageUrl: map['image_url'],
    category: map['category'] != null
        ? GalleryCategory.fromMap(map['category'])
        : null,
    date: map['date'] != null ? DateTime.parse(map['date']) : null,
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "description": description,
    "image_url": imageUrl,
    "category": category?.toMap(),
    "date": date?.toIso8601String(),
  };
}

class GalleryCategory {
  final String id;
  final String name;
  final String? imageUrl;

  GalleryCategory({required this.id, required this.name, this.imageUrl});

  String toJson() => json.encode(toMap());

  factory GalleryCategory.fromJson(String str) =>
      GalleryCategory.fromMap(json.decode(str));

  factory GalleryCategory.fromMap(Map<String, dynamic> map) => GalleryCategory(
    id: map['id'],
    name: map['name'],
    imageUrl: map['image_url'],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "image_url": imageUrl,
  };
}
