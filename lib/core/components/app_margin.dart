import 'package:flutter/material.dart';

class AppMargin extends StatelessWidget {
  const AppMargin({
    super.key,
    required this.child,
    this.horizontal = 11,
    this.vertical = 0,
    this.color = Colors.transparent,
  });

  final Widget child;
  final double horizontal;
  final double vertical;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: child,
    );
  }
}
