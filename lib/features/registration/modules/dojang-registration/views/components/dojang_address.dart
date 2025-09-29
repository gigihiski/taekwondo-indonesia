import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_dropdown.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/components/app_text_field.dart';

class DojangAddress extends StatelessWidget {
  const DojangAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextCaptionSemiBold(text: "Alamat Dojang"),
        SizedBox(height: 8),
        AppDropDown(
          title: "Provinsi",
          hint: "Pilih Provinsi",
          options: [],
          onChanged: (index) {},
        ),
        SizedBox(height: 8),
        AppDropDown(
          title: "Kota/Kabupaten",
          hint: "Pilih Kota/Kabupaten",
          options: [],
          onChanged: (index) {},
        ),
        SizedBox(height: 8),
        AppDropDown(
          title: "Kecamatan",
          hint: "Pilih Kecamatan",
          options: [],
          onChanged: (index) {},
        ),
        SizedBox(height: 8),
        AppTextField(hint: "URL Google Maps"),
      ],
    );
  }
}
