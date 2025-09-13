import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// KU Crimson -- #ED1C24
  static const kUCrimson = MaterialColor(0xFFED1C24, <int, Color>{
    500: Color(0xFFED1C24),
  });

  /// Saffron -- #F1BB31
  static const saffron = MaterialColor(0xFFF1BB31, <int, Color>{
    500: Color(0xFFF1BB31),
  });

  /// Granite Gray -- #636363
  static const graniteGray = MaterialColor(0xFF636363, <int, Color>{
    500: Color(0xFF636363),
  });

  /// Dark Charcoal -- #313131
  static const darkCharcoal = MaterialColor(0xFF313131, <int, Color>{
    500: Color(0xFF313131),
  });

  /// Cultured -- #F5F5F5
  static const cultured = MaterialColor(0xFFF5F5F5, <int, Color>{
    500: Color(0xFFF5F5F5),
  });

  /// Spanish Gray -- #969696
  static const spanishGray = MaterialColor(0xFF969696, <int, Color>{
    500: Color(0xFF969696),
  });

  /// Platinum -- #E6E6E6
  static const platinum = MaterialColor(0xFFE6E6E6, <int, Color>{
    500: Color(0xFFE6E6E6),
  });

  /// Deep Carmine Pink -- #FD3535
  static const deepCarminePink = MaterialColor(0xFFFD3535, <int, Color>{
    500: Color(0xFFFD3535),
  });

  /// Crayola -- #FFCE6B
  static const crayola = MaterialColor(0xFFFFCE6B, <int, Color>{
    500: Color(0xFFFFCE6B),
  });

  /// Royal Blue -- #3175DB
  static const royalBlue = MaterialColor(0xFF3175DB, <int, Color>{
    500: Color(0xFF3175DB),
  });

  /// Maximum Blue Purple -- #A7B1E2
  static const maximumBluePurple = MaterialColor(0xFFA7B1E2, <int, Color>{
    500: Color(0xFFA7B1E2),
  });

  /// Jasmine -- #F5E380
  static const jasmine = MaterialColor(0xFFF5E380, <int, Color>{
    500: Color(0xFFF5E380),
  });

  /// Peru -- #BD8A3E
  static const peru = MaterialColor(0xFFBD8A3E, <int, Color>{
    500: Color(0xFFBD8A3E),
  });

  /// Jasper Orange -- #DBA145
  static const jasperOrange = MaterialColor(0xFFDBA145, <int, Color>{
    500: Color(0xFFDBA145),
  });

  /// Blue -- #264952
  static const blue = MaterialColor(0xFF222222, <int, Color>{
    100: Color(0xFF999999),
    200: Color(0xFF777777),
    300: Color(0xFF525252),
    400: Color(0xFF343434),
    500: Color(0xFF222222),
  });

  // ------- Shortcut Color --------
  static const primary = kUCrimson;
  static const secondary = saffron;
  static const tertiary = Colors.black;

  static const success = Colors.green;
  static const danger = Colors.red;
  static const warning = Colors.amber;
  static const info = Colors.blue;

  static const background = cultured;
}
