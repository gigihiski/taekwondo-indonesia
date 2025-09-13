import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/services/location/models/coordinate.dart';

class EventBazaarResponse {
  final Meta meta;
  final List<EventBazaar> data;

  EventBazaarResponse({required this.meta, required this.data});

  factory EventBazaarResponse.fromJson(String str) =>
      EventBazaarResponse.fromMap(json.decode(str));

  factory EventBazaarResponse.fromMap(Map<String, dynamic> map) {
    return EventBazaarResponse(
      meta: Meta.fromMap(map["meta"]),
      data: map['data'] != null
          ? List<EventBazaar>.from(
              map['data'].map((x) => EventBazaar.fromMap(x)),
            )
          : [],
    );
  }
}

class EventBazaar {
  final String id;
  final String title;
  final List<String> images;
  final String range;
  final String shortDescription;
  final String longDescription;
  final List<String> schedules;
  final EventBazaarLocation location;

  EventBazaar({
    required this.id,
    required this.title,
    required this.images,
    required this.range,
    required this.shortDescription,
    required this.longDescription,
    required this.schedules,
    required this.location,
  });

  String toJson() => json.encode(toMap());

  factory EventBazaar.fromJson(String str) =>
      EventBazaar.fromMap(json.decode(str));

  factory EventBazaar.fromMap(Map<String, dynamic> map) => EventBazaar(
    id: map['id'],
    title: map['title'],
    images: List<String>.from(map['images'].map((x) => x)),
    range: map['range'],
    shortDescription: map['short_description'],
    longDescription: map['long_description'],
    schedules: List<String>.from(map['schedules'].map((x) => x)),
    location: EventBazaarLocation.fromMap(map['location']),
  );

  List<EventBazaarSchedule> get eventTimes {
    final List<EventBazaarSchedule> times = [];
    for (var schedule in schedules) {
      final date = schedule.substring(0, 10);
      final startTime = schedule.substring(11, 16);
      final endTime = schedule.substring(22, 27);
      times.add(
        EventBazaarSchedule(date: date, startTime: startTime, endTime: endTime),
      );
    }
    return times;
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "images": List<dynamic>.from(images.map((x) => x)),
    "range": range,
    "short_description": shortDescription,
    "long_description": longDescription,
    "schedules": List<dynamic>.from(schedules.map((x) => x)),
    "location": location.toMap(),
  };
}

class EventBazaarLocation {
  final String venue;
  final String address;
  final Coordinate coordinate;

  EventBazaarLocation({
    required this.venue,
    required this.address,
    required this.coordinate,
  });

  String toJson() => json.encode(toMap());

  factory EventBazaarLocation.fromJson(String str) =>
      EventBazaarLocation.fromMap(json.decode(str));

  factory EventBazaarLocation.fromMap(Map<String, dynamic> map) =>
      EventBazaarLocation(
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

class EventBazaarSchedule {
  final String date;
  final String startTime;
  final String endTime;

  EventBazaarSchedule({
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
