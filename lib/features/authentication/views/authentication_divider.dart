import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';

class AuthenticationDivider extends StatelessWidget {
  final String text;
  final Color color;

  const AuthenticationDivider({
    super.key,
    required this.text,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final divider = Expanded(child: Divider(color: color, thickness: 0.5));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        divider,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: AppTextCaption(text: text, color: Colors.white),
        ),
        divider,
      ],
    );
  }
}
