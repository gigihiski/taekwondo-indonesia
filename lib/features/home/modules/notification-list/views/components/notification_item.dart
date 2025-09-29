import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    final icon = Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(Icons.notifications_none_rounded, color: Colors.white),
    );

    final information = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextParagraphSemiBold(text: "Status Pendaftaran Dojang"),
          SizedBox(height: 5),
          AppTextCaption(text: "Pendaftaran Dojang Disetujui"),
        ],
      ),
    );

    final content = Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [icon, SizedBox(width: 10), information],
      ),
    );

    final date = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AppTextCaption(text: "29/10/2025", color: Colors.grey),
        AppTextCaption(text: "10:00", color: Colors.grey),
      ],
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [content, date],
      ),
    );
  }
}
