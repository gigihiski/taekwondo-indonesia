import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_dropdown.dart';
import 'package:taekwondo/core/components/app_text.dart';

class AthleteAddress extends StatelessWidget {
  const AthleteAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextCaptionSemiBold(text: "Nama Dojang"),
        SizedBox(height: 8),
        AppDropDown(
          title: "Dojang",
          hint: "Pilih Dojang",
          options: [],
          onChanged: (index) {},
        ),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Nama Pelatih"),
        SizedBox(height: 8),
        AppDropDown(
          title: "Pelatih",
          hint: "Pilih Pelatih",
          options: [],
          onChanged: (index) {},
        ),
      ],
    );
  }
}
