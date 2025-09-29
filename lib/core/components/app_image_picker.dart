import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class AppImagePicker extends StatefulWidget {
  const AppImagePicker({super.key, required this.onChanged});

  final Function(XFile?) onChanged;

  @override
  AppImagePickerState createState() => AppImagePickerState();
}

class AppImagePickerState extends State<AppImagePicker> {
  final ImagePicker imagePicker = ImagePicker();
  XFile? selectedImage;

  @override
  void initState() {
    super.initState();
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await imagePicker.pickImage(
        source: source,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 80,
      );

      if (image != null) {
        setState(() {
          selectedImage = image;
          widget.onChanged(selectedImage);
        });
      }
    } catch (e) {
      print('Gagal memilih gambar: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final information = Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.cloud_upload_outlined, color: Colors.black),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppTextCaptionSemiBold(text: "Upload Files"),
            SizedBox(height: 4),
            AppTextCaption(
              text: "Select and upload files",
              color: AppColors.graniteGray,
            ),
          ],
        ),
      ],
    );

    final header = Padding(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          information,
          InkWell(
            onTap: () {
              setState(() {
                selectedImage = null;
                widget.onChanged(null);
              });
            },
            child: Icon(Icons.close),
          ),
        ],
      ),
    );

    final filled = InkWell(
      onTap: () {
        pickImage(ImageSource.gallery);
      },
      child: selectedImage != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.file(File(selectedImage!.path), fit: BoxFit.cover),
            )
          : Container(),
    );

    final empty = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.cloud_upload_outlined),
          AppTextParagraph(text: "Choose a file"),
          SizedBox(height: 3),
          AppTextCaption(
            text: "JPEG, PNG, PDF up to 1MB",
            color: AppColors.graniteGray,
          ),
          SizedBox(height: 25),
          InkWell(
            onTap: () {
              pickImage(ImageSource.gallery);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: AppColors.platinum),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: AppTextCaption(text: "Browse File"),
            ),
          ),
        ],
      ),
    );

    final imageContainer = Container(
      height: 221,
      margin: EdgeInsets.symmetric(horizontal: 17, vertical: 17),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: selectedImage != null ? filled : empty,
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.background,
      ),
      child: Column(
        children: [
          header,
          Divider(color: AppColors.platinum, thickness: 2),
          imageContainer,
        ],
      ),
    );
  }
}
