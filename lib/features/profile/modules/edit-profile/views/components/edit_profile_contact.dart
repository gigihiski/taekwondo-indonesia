import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_dropdown.dart';
import 'package:taekwondo/core/components/app_image_picker.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/components/app_text_field.dart';

class EditProfileContact extends StatelessWidget {
  const EditProfileContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextCaptionSemiBold(text: "Kontak Darurat"),
        SizedBox(height: 8),
        AppDropDown(
          title: "Kontak Darurat",
          hint: "Pilih Kontak Darurat",
          options: [],
          onChanged: (index) {},
        ),
        SizedBox(height: 8),
        AppTextField(hint: "No. Handphone"),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "BPJS"),
        SizedBox(height: 8),
        AppTextField(hint: "No. Kartu BPJS"),
        SizedBox(height: 8),
        AppImagePicker(onChanged: (file) {}),
      ],
    );
  }
}
