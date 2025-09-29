import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_dropdown.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/components/app_text_field.dart';

class AthleteManagement extends StatelessWidget {
  const AthleteManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextCaptionSemiBold(text: "Golongan Darah"),
        SizedBox(height: 8),
        AppDropDown(
          title: "Golongan Darah",
          hint: "Pilih Golongan Darah",
          options: [],
          onChanged: (index) {},
        ),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Berat Badan"),
        SizedBox(height: 8),
        AppTextField(hint: "Contoh: 70 kg"),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Tinggi Badan"),
        SizedBox(height: 8),
        AppTextField(hint: "Contoh: 170 cm"),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Ukuran Baju"),
        SizedBox(height: 8),
        AppDropDown(
          title: "Ukuran Baju",
          hint: "Pilih Ukuran Baju",
          options: [],
          onChanged: (index) {},
        ),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Ukuran Sepatu"),
        SizedBox(height: 8),
        AppDropDown(
          title: "Ukuran Sepatu",
          hint: "Pilih Ukuran Sepatu",
          options: [],
          onChanged: (index) {},
        ),
      ],
    );
  }
}
