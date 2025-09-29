import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/components/app_text_field.dart';

class DojangManagement extends StatelessWidget {
  const DojangManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextCaptionSemiBold(text: "Pengurus Dojang"),
        SizedBox(height: 8),
        AppTextField(hint: "Ketua"),
        SizedBox(height: 8),
        AppTextField(hint: "Wakil Ketua"),
        SizedBox(height: 8),
        AppTextField(hint: "Bendahara"),
        SizedBox(height: 8),
        AppTextField(hint: "Sekretaris"),
      ],
    );
  }
}
