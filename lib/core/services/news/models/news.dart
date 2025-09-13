import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/services/location/models/coordinate.dart';

class NewsResponse {
  final Meta meta;
  final List<News> data;

  NewsResponse({required this.meta, required this.data});

  factory NewsResponse.fromJson(String str) =>
      NewsResponse.fromMap(json.decode(str));

  factory NewsResponse.fromMap(Map<String, dynamic> map) {
    return NewsResponse(
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
  final List<String> images;
  final String shortDescription;
  final String longDescription;
  final List<String> schedules;
  final NewsLocation location;

  News({
    required this.id,
    required this.title,
    required this.images,
    required this.shortDescription,
    required this.longDescription,
    required this.schedules,
    required this.location,
  });

  String toJson() => json.encode(toMap());

  factory News.fromJson(String str) => News.fromMap(json.decode(str));

  factory News.fromMap(Map<String, dynamic> map) => News(
    id: map['id'],
    title: map['title'],
    images: List<String>.from(map['images'].map((x) => x)),
    shortDescription: map['short_description'],
    longDescription: map['long_description'],
    schedules: List<String>.from(map['schedules'].map((x) => x)),
    location: NewsLocation.fromMap(map['location']),
  );

  List<NewsSchedule> get eventTimes {
    final List<NewsSchedule> times = [];
    for (var schedule in schedules) {
      final date = schedule.substring(0, 10);
      final startTime = schedule.substring(11, 16);
      final endTime = schedule.substring(22, 27);
      times.add(
        NewsSchedule(date: date, startTime: startTime, endTime: endTime),
      );
    }
    return times;
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "images": List<dynamic>.from(images.map((x) => x)),
    "short_description": shortDescription,
    "long_description": longDescription,
    "schedules": List<dynamic>.from(schedules.map((x) => x)),
    "location": location.toMap(),
  };
}

class NewsLocation {
  final String venue;
  final String address;
  final Coordinate coordinate;

  NewsLocation({
    required this.venue,
    required this.address,
    required this.coordinate,
  });

  String toJson() => json.encode(toMap());

  factory NewsLocation.fromJson(String str) =>
      NewsLocation.fromMap(json.decode(str));

  factory NewsLocation.fromMap(Map<String, dynamic> map) => NewsLocation(
    venue: map["venue"],
    address: map["address"],
    coordinate: Coordinate.fromMap(map["coordinate"]),
  );

  Map<String, dynamic> toMap() => {
    "venue": venue,
    "address": address,
    "coordinate": coordinate.toMap(),
  };
}

class NewsSchedule {
  final String date;
  final String startTime;
  final String endTime;

  NewsSchedule({
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  String get formattedDate {
    final f = DateFormat('dd/MM/yyyy');
    final date = f.parse(this.date);
    return DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(date);
  }

  String get formattedDateOnly {
    final f = DateFormat('dd/MM/yyyy');
    final date = f.parse(this.date);
    return DateFormat('dd MMMM yyyy', 'id_ID').format(date);
  }
}
