import 'dart:convert';
import 'package:taekwondo/core/models/meta.dart';

class NotificationsResponse {
  final Meta meta;
  final List<AppNotification> data;

  NotificationsResponse({required this.meta, required this.data});

  factory NotificationsResponse.fromJson(String str) =>
      NotificationsResponse.fromMap(json.decode(str));

  factory NotificationsResponse.fromMap(Map<String, dynamic> map) {
    return NotificationsResponse(
      meta: Meta.fromMap(map["meta"]),
      data: map['data'] != null
          ? List<AppNotification>.from(
              map['data'].map((x) => AppNotification.fromMap(x)),
            )
          : [],
    );
  }
}

class NotificationResponse {
  final Meta meta;
  final AppNotification data;

  NotificationResponse({required this.meta, required this.data});

  factory NotificationResponse.fromJson(String str) =>
      NotificationResponse.fromMap(json.decode(str));

  factory NotificationResponse.fromMap(Map<String, dynamic> map) {
    return NotificationResponse(
      meta: Meta.fromMap(map["meta"]),
      data: AppNotification.fromMap(map["meta"]),
    );
  }
}

class AppNotification {
  final String id;
  final String title;
  final String imageUrl;
  final String? description;
  final NotificationCategory? category;
  final DateTime? date;

  AppNotification({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.description,
    this.category,
    this.date,
  });

  String toJson() => json.encode(toMap());

  factory AppNotification.fromJson(String str) =>
      AppNotification.fromMap(json.decode(str));

  factory AppNotification.fromMap(Map<String, dynamic> map) => AppNotification(
    id: map['id'],
    title: map['title'],
    description: map['description'],
    imageUrl: map['image_url'],
    category: map['category'] != null
        ? NotificationCategory.fromMap(map['category'])
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

class NotificationCategory {
  final String id;
  final String name;
  final String? imageUrl;

  NotificationCategory({required this.id, required this.name, this.imageUrl});

  String toJson() => json.encode(toMap());

  factory NotificationCategory.fromJson(String str) =>
      NotificationCategory.fromMap(json.decode(str));

  factory NotificationCategory.fromMap(Map<String, dynamic> map) =>
      NotificationCategory(
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
