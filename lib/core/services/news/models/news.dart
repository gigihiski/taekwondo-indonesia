import 'dart:convert';

import 'package:taekwondo/core/models/meta.dart';

class NewsResponse {
  final Meta meta;
  final News data;

  NewsResponse({required this.meta, required this.data});

  factory NewsResponse.fromJson(String str) =>
      NewsResponse.fromMap(json.decode(str));

  factory NewsResponse.fromMap(Map<String, dynamic> map) {
    return NewsResponse(
      meta: Meta.fromMap(map["meta"]),
      data: News.fromMap(map["data"]),
    );
  }
}

class NewsesResponse {
  final Meta meta;
  final List<News> data;

  NewsesResponse({required this.meta, required this.data});

  factory NewsesResponse.fromJson(String str) =>
      NewsesResponse.fromMap(json.decode(str));

  factory NewsesResponse.fromMap(Map<String, dynamic> map) {
    return NewsesResponse(
      meta: Meta.fromMap(map["meta"]),
      data: map['data'] != null
          ? List<News>.from(map['data'].map((x) => News.fromMap(x)))
          : [],
    );
  }
}

class News {
  final String id;
  final String title;
  final String summary;
  final DateTime publishedAt;
  final int viewCount;
  final bool isFeatured;

  final NewsCategory category;

  final String? slug;
  final String? content;
  final String? featuredImage;

  News({
    required this.id,
    required this.title,
    required this.summary,
    required this.publishedAt,
    required this.viewCount,
    required this.isFeatured,
    required this.category,
    this.slug,
    this.content,
    this.featuredImage,
  });

  String toJson() => json.encode(toMap());

  factory News.fromJson(String str) => News.fromMap(json.decode(str));

  factory News.fromMap(Map<String, dynamic> map) => News(
    id: map['id'],
    title: map['title'],
    summary: map['summary'],
    publishedAt: DateTime.parse(map['published_at']),
    viewCount: map['view_count'],
    isFeatured: map['is_featured'],
    category: NewsCategory.fromMap(map['category']),
    slug: map['slug'],
    content: map['content'],
    featuredImage: map['featured_image'],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "summary": summary,
    "published_at": publishedAt,
    "view_count": viewCount,
    "is_featured": isFeatured,
    "category": category.toMap(),
    "slug": slug,
    "content": content,
    "featured_image": featuredImage,
  };
}

class NewsCategory {
  final String id;
  final String name;

  NewsCategory({required this.id, required this.name});

  String toJson() => json.encode(toMap());

  factory NewsCategory.fromJson(String str) =>
      NewsCategory.fromMap(json.decode(str));

  factory NewsCategory.fromMap(Map<String, dynamic> map) =>
      NewsCategory(id: map["id"], name: map["name"]);

  Map<String, dynamic> toMap() => {"id": id, "name": name};
}
