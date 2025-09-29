import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_image_picker.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/components/app_text_field.dart';

class RefreePersonal extends StatelessWidget {
  const RefreePersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextCaptionSemiBold(text: "Nomor Sertifikat Nasional (PBTI)"),
        SizedBox(height: 8),
        AppTextField(hint: "Nomor Sertifikat"),
        SizedBox(height: 8),
        AppImagePicker(onChanged: (file) {}),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Nomor Sertifikat Kukiwon"),
        SizedBox(height: 8),
        AppTextField(hint: "Nomor Sertifikat"),
        SizedBox(height: 8),
        AppImagePicker(onChanged: (file) {}),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Mulai Menjadi Wasit Taekwondo"),
        SizedBox(height: 8),
        AppTextField(hint: "Bulan / Tahun"),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Sertifikasi Wasit"),
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
