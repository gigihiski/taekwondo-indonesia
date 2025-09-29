import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_image_picker.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/components/app_text_field.dart';

class DojangPersonal extends StatelessWidget {
  const DojangPersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextCaptionSemiBold(text: "Nama Dojang"),
        SizedBox(height: 8),
        AppTextField(hint: "Contoh: Dojang ABC"),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Logo Dojang"),
        SizedBox(height: 8),
        AppImagePicker(onChanged: (file) {}),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Foto Dojang"),
        SizedBox(height: 8),
        AppImagePicker(onChanged: (file) {}),
      ],
    );
  }
}
