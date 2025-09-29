import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/components/app_text_style.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class AppDropDown<T> extends StatefulWidget {
  const AppDropDown({
    super.key,
    required this.title,
    required this.hint,
    required this.options,
    required this.onChanged,
    this.selectedIndex,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String title;
  final String hint;
  final List<T> options;
  final int? selectedIndex;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(int) onChanged;

  @override
  AppDropDownState createState() => AppDropDownState();
}

class AppDropDownState<T> extends State<AppDropDown<T>> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textFieldDecoration = InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 12),
      prefixIcon: widget.prefixIcon,
      suffixIcon: Padding(
        padding: EdgeInsets.all(12),
        child: Icon(Icons.keyboard_arrow_down_rounded),
      ),
      border: InputBorder.none,
      labelText: widget.title,
      labelStyle: AppTextStyleParagraph(color: AppColors.graniteGray).textStyle,
    );

    final container = Container(
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.background,
      ),
      child: Center(
        child: TextFormField(
          enabled: false,
          initialValue: null,
          controller: controller,
          decoration: textFieldDecoration,
          style: AppTextStyleParagraph().textStyle,
        ),
      ),
    );

    return InkWell(onTap: () {}, child: container);
  }
}

class AppDropdownAdvance extends StatelessWidget {
  const AppDropdownAdvance({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
  });

  final String icon;
  final Color iconColor;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final image = Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: iconColor,
      ),
      child: SvgPicture.asset(
        icon,
        height: 16,
        width: 16,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        fit: BoxFit.cover,
      ),
    );

    final information = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextParagraph(text: title, color: AppColors.graniteGray),
        AppTextCaptionSemiBold(text: description),
      ],
    );

    final informationSection = Row(
      children: [image, SizedBox(width: 12), information],
    );

    return Container(
      height: 41,
      padding: EdgeInsets.only(left: 8, top: 4, bottom: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.platinum),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          informationSection,
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(Icons.keyboard_arrow_down_sharp),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
