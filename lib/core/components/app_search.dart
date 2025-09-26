import 'package:flutter/material.dart';
import 'package:taekwondo/core/themes/app_fonts.dart';

final textFieldPadding = EdgeInsets.symmetric(vertical: 10, horizontal: 12);

class AppSearch extends StatelessWidget {
  const AppSearch({super.key, required this.hint, this.color = Colors.white});

  final String hint;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: textFieldPadding,
      height: 45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        style: TextStyle(
          fontFamily: AppFonts.plusJakartaSans,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: Icon(Icons.search_rounded, color: Colors.grey),
          border: InputBorder.none,
          hintText: hint,
          labelStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
