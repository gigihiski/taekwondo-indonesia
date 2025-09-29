import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key});

  @override
  Widget build(BuildContext context) {
    final icon = Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(Icons.card_membership, color: Colors.white),
    );

    final information = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextParagraphSemiBold(text: "Pendaftaran Dojang"),
        SizedBox(height: 5),
        AppTextCaption(text: "Pembelian dari Mobile"),
        SizedBox(height: 10),
        AppTextCaption(text: "Transaction ID"),
        SizedBox(height: 2),
        AppTextCaption(text: "#1234567899"),
      ],
    );

    final value = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AppTextParagraphSemiBold(text: "Rp 200,000.00"),
        SizedBox(height: 5),
        AppTextCaption(text: "Success", color: Colors.green),
        SizedBox(height: 10),
        AppTextCaption(text: "29 September 2025"),
        SizedBox(height: 2),
        AppTextCaption(text: "10:00"),
      ],
    );

    final content = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [icon, SizedBox(width: 10), information],
    );

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [content, value],
      ),
    );
  }
}
