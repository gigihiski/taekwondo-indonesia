import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_dropdown.dart';
import 'package:taekwondo/core/components/app_image_picker.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/components/app_text_field.dart';

class EditProfilePersonal extends StatelessWidget {
  const EditProfilePersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextCaptionSemiBold(text: "Nama Lengkap"),
        SizedBox(height: 8),
        AppTextField(hint: "Contoh: Gigih Prasetyawan"),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Tempat Lahir"),
        SizedBox(height: 8),
        AppDropDown(
          title: "Negara",
          hint: "Pilih Negara",
          options: [],
          onChanged: (index) {},
        ),
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
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Tanggal Lahir"),
        SizedBox(height: 8),
        AppTextField(hint: "Tgl / Bln / Thn"),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Jenis Kelamin"),
        SizedBox(height: 8),
        AppDropDown(
          title: "Jenis Kelamin",
          hint: "Pilih Jenis Kelamin",
          options: [],
          onChanged: (index) {},
        ),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "No Handphone"),
        SizedBox(height: 8),
        AppTextField(hint: "Contoh: 08xxxxxxxx"),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Email"),
        SizedBox(height: 8),
        AppTextField(hint: "Contoh: email@domain.com"),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Identitas"),
        SizedBox(height: 8),
        AppDropDown(
          title: "Identitas",
          hint: "Pilih Identitas",
          options: [],
          onChanged: (index) {},
        ),
        SizedBox(height: 8),
        AppTextField(hint: "Contoh: No Identitas"),
        SizedBox(height: 8),
        AppImagePicker(onChanged: (file) {}),
        SizedBox(height: 10),
        AppTextCaptionSemiBold(text: "Foto Profile"),
        SizedBox(height: 8),
        AppImagePicker(onChanged: (file) {}),
      ],
    );
  }
}
