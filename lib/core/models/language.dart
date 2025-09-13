import 'dart:convert';

import 'package:taekwondo/core/themes/app_assets.dart';

enum LanguageCode { en, id }

class Language {
  final String icon;
  final String name;
  final LanguageCode code;

  const Language({required this.icon, required this.name, required this.code});

  factory Language.fromJson(String str) => Language.fromMap(json.decode(str));

  factory Language.fromMap(Map<String, dynamic> json) {
    return Language(
      icon: json["icon"],
      name: json["name"],
      code: json["code"] == "id" ? LanguageCode.id : LanguageCode.en,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {"icon": icon, "name": name, "code": code.name};
  }

  static List<Language> init() {
    return [
      Language(
        icon: AppAssets.idFlag,
        name: 'Bahasa ( Indonesia )',
        code: LanguageCode.id,
      ),
      Language(
        icon: AppAssets.ukFlag,
        name: 'English ( United Kingdom )',
        code: LanguageCode.en,
      ),
    ];
  }
}
