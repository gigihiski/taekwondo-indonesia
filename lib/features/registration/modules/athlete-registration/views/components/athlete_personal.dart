import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_image_picker.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/components/app_text_field.dart';

class AthletePersonal extends StatelessWidget {
  const AthletePersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextCaptionSemiBold(text: "Nama Athlete"),
        SizedBox(height: 8),
        AppTextField(hint: "Contoh: Athlete ABC"),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Logo Athlete"),
        SizedBox(height: 8),
        AppImagePicker(onChanged: (file) {}),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Foto Athlete"),
        SizedBox(height: 8),
        AppImagePicker(onChanged: (file) {}),
      ],
    );
  }
}
