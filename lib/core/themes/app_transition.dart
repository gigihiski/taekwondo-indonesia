import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppTransition {
  static PageTransition pushTransition(
    Widget child,
    RouteSettings settings, {
    PageTransitionType type = PageTransitionType.rightToLeft,
  }) =>
      PageTransition(
        type: type,
        child: child,
        duration: Duration(milliseconds: 300),
        reverseDuration: Duration(milliseconds: 300),
        settings: settings,
      );
}
