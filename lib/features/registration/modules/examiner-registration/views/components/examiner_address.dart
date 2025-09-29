import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_image_picker.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/components/app_text_field.dart';

class ExaminerAddress extends StatelessWidget {
  const ExaminerAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextCaptionSemiBold(text: "Pengalaman Penguji"),
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
