import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/services/location/models/coordinate.dart';

class EventResponse {
  final Meta meta;
  final List<Event> data;

  EventResponse({required this.meta, required this.data});

  factory EventResponse.fromJson(String str) =>
      EventResponse.fromMap(json.decode(str));

  factory EventResponse.fromMap(Map<String, dynamic> map) {
    return EventResponse(
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
  final List<String> images;
  final String shortDescription;
  final String longDescription;
  final List<String> schedules;
  final EventLocation location;

  Event({
    required this.id,
    required this.title,
    required this.images,
    required this.shortDescription,
    required this.longDescription,
    required this.schedules,
    required this.location,
  });

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String str) => Event.fromMap(json.decode(str));

  factory Event.fromMap(Map<String, dynamic> map) => Event(
    id: map['id'],
    title: map['title'],
    images: List<String>.from(map['images'].map((x) => x)),
    shortDescription: map['short_description'],
    longDescription: map['long_description'],
    schedules: List<String>.from(map['schedules'].map((x) => x)),
    location: EventLocation.fromMap(map['location']),
  );

  List<EventSchedule> get eventTimes {
    final List<EventSchedule> times = [];
    for (var schedule in schedules) {
      final date = schedule.substring(0, 10);
      final startTime = schedule.substring(11, 16);
      final endTime = schedule.substring(22, 27);
      times.add(
        EventSchedule(date: date, startTime: startTime, endTime: endTime),
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

class EventLocation {
  final String venue;
  final String address;
  final Coordinate coordinate;

  EventLocation({
    required this.venue,
    required this.address,
    required this.coordinate,
  });

  String toJson() => json.encode(toMap());

  factory EventLocation.fromJson(String str) =>
      EventLocation.fromMap(json.decode(str));

  factory EventLocation.fromMap(Map<String, dynamic> map) => EventLocation(
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

class EventSchedule {
  final String date;
  final String startTime;
  final String endTime;

  EventSchedule({
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
