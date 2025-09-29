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
        AppTextCaptionSemiBold(text: "Mulai Berlatih"),
        SizedBox(height: 8),
        AppTextField(hint: "Bulan / Tahun"),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Sabuk Saat Ini"),
        SizedBox(height: 8),
        AppImagePicker(onChanged: (file) {}),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Pelatihan Atlit"),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: AppTextField(hint: "Internasional")),
            SizedBox(width: 10),
            Expanded(child: AppTextField(hint: "2025")),
          ],
        ),
        SizedBox(height: 8),
        AppImagePicker(onChanged: (file) {}),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Prestasi Atlit"),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: AppTextField(hint: "Internasional")),
            SizedBox(width: 10),
            Expanded(child: AppTextField(hint: "2025")),
          ],
        ),
        SizedBox(height: 8),
        AppImagePicker(onChanged: (file) {}),
      ],
    );
  }
}
