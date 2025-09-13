import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/core/themes/app_fonts.dart';

final textFieldPadding = EdgeInsets.only(
  top: 16,
  bottom: 16,
  left: 19,
  right: 19,
);

class AppSearch extends StatelessWidget {
  const AppSearch({super.key, required this.hint});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        style: TextStyle(
          fontFamily: AppFonts.plusJakartaSans,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: textFieldPadding,
          suffixIcon: Padding(
            padding: textFieldPadding,
            child: SvgPicture.asset(
              AppAssets.logo,
              width: 18,
              height: 18,
              color: Colors.white,
            ),
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: AppFonts.plusJakartaSans,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.white,
          ),
          labelStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
