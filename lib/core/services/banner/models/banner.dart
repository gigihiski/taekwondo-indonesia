import 'dart:convert';

import 'package:taekwondo/core/models/meta.dart';

class BannerResponse {
  final Meta meta;
  final List<EventBanner> data;

  BannerResponse({required this.meta, required this.data});

  factory BannerResponse.fromJson(String str) =>
      BannerResponse.fromMap(json.decode(str));

  factory BannerResponse.fromMap(Map<String, dynamic> map) {
    return BannerResponse(
      meta: Meta.fromMap(map["meta"]),
      data: map['data'] != null
          ? List<EventBanner>.from(
              map['data'].map((x) => EventBanner.fromMap(x)),
            )
          : [],
    );
  }
}

class EventBanner {
  final String id;
  final String path;

  EventBanner({required this.id, required this.path});

  String toJson() => json.encode(toMap());

  factory EventBanner.fromJson(String str) =>
      EventBanner.fromMap(json.decode(str));

  factory EventBanner.fromMap(Map<String, dynamic> map) =>
      EventBanner(id: map['id'], path: map['path']);

  Map<String, dynamic> toMap() => {"id": id, "path": path};
}
