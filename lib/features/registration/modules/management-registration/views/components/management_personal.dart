import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_image_picker.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/components/app_text_field.dart';

class ManagementPersonal extends StatelessWidget {
  const ManagementPersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextCaptionSemiBold(text: "PBTI"),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: AppTextField(hint: "Jabatan")),
            SizedBox(width: 10),
            Expanded(child: AppTextField(hint: "2022 - 2025")),
          ],
        ),
        SizedBox(height: 8),
        AppImagePicker(onChanged: (file) {}),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Provinsi"),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: AppTextField(hint: "Jabatan")),
            SizedBox(width: 10),
            Expanded(child: AppTextField(hint: "2022 - 2025")),
          ],
        ),
        SizedBox(height: 8),
        AppImagePicker(onChanged: (file) {}),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Kota / Kabupaten"),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: AppTextField(hint: "Jabatan")),
            SizedBox(width: 10),
            Expanded(child: AppTextField(hint: "2022 - 2025")),
          ],
        ),
        SizedBox(height: 8),
        AppImagePicker(onChanged: (file) {}),
      ],
    );
  }
}
