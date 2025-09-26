import 'dart:convert';
import 'package:taekwondo/core/models/meta.dart';

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
  final String description;
  final String path;
  final DateTime date;

  Gallery({
    required this.id,
    required this.title,
    required this.description,
    required this.path,
    required this.date,
  });

  String toJson() => json.encode(toMap());

  factory Gallery.fromJson(String str) => Gallery.fromMap(json.decode(str));

  factory Gallery.fromMap(Map<String, dynamic> map) => Gallery(
    id: map['id'],
    title: map['title'],
    description: map['description'],
    path: map['path'],
    date: DateTime.parse(map['date']),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "description": description,
    "path": path,
    "date": date.toIso8601String(),
  };
}
