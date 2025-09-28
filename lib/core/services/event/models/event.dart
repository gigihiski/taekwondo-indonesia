import 'dart:convert';

import 'package:taekwondo/core/models/meta.dart';

class EventResponse {
  final Meta meta;
  final Event data;

  EventResponse({required this.meta, required this.data});

  factory EventResponse.fromJson(String str) =>
      EventResponse.fromMap(json.decode(str));

  factory EventResponse.fromMap(Map<String, dynamic> map) {
    return EventResponse(
      meta: Meta.fromMap(map["meta"]),
      data: Event.fromMap(map["data"]),
    );
  }
}

class EventsResponse {
  final Meta meta;
  final List<Event> data;

  EventsResponse({required this.meta, required this.data});

  factory EventsResponse.fromJson(String str) =>
      EventsResponse.fromMap(json.decode(str));

  factory EventsResponse.fromMap(Map<String, dynamic> map) {
    return EventsResponse(
      meta: Meta.fromMap(map["meta"]),
      data: map['data'] != null
          ? List<Event>.from(map['data'].map((x) => Event.fromMap(x)))
          : [],
    );
  }
}

class Event {
  final String id;
  final String title;
  final String coverImg;
  final String? description;
  final DateTime date;
  final String city;
  final String province;
  final String? venue;
  final String? address;
  final double? latitude;
  final double? longitude;

  Event({
    required this.id,
    required this.title,
    required this.coverImg,
    required this.date,
    required this.city,
    required this.province,
    this.description,
    this.venue,
    this.address,
    this.latitude,
    this.longitude,
  });

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String str) => Event.fromMap(json.decode(str));

  factory Event.fromMap(Map<String, dynamic> map) => Event(
    id: map['id'],
    title: map['title'],
    coverImg: map['cover_img'],
    description: map['description'],
    date: DateTime.parse(map['date']),
    city: map['city'],
    province: map['province'],
    venue: map['venue'],
    address: map['address'],
    latitude: double.parse(map['latitude'] ?? "0"),
    longitude: double.parse(map['longitude'] ?? "0"),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "cover_img": coverImg,
    "description": description,
    "date": date.toIso8601String(),
    "city": city,
    "province": province,
    "venue": venue,
    "address": address,
    "latitude": latitude.toString(),
    "longitude": longitude.toString(),
  };
}
