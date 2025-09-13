import 'package:flutter/material.dart';
import 'package:taekwondo/core/themes/app_transition.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';
import 'package:page_transition/page_transition.dart';

class AppNavigator {
  final BuildContext context;
  final Widget? page;
  final RouteSettings? route;

  AppNavigator({required this.context, this.page, this.route});

  void push() {
    if (page == null) throw AppException("ROUTE_NOT_FOUND");
    if (route == null) throw AppException("ROUTE_SETTING_NOT_FOUND");

    Navigator.of(context).push(
      AppTransition.pushTransition(
        page!,
        route!,
        type: PageTransitionType.rightToLeft,
      ),
    );
  }

  void pop() {
    Navigator.of(context).pop();
  }
}
