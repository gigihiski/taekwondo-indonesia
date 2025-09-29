import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  PaymentViewState createState() => PaymentViewState();
}

class PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    final information = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextCaption(text: "Berakhir dalam", color: Colors.grey),
        SizedBox(height: 2),
        AppTextParagraph(text: "22 September 2025, 10:00 WIB"),
      ],
    );

    final note = Row(
      children: [
        Icon(Icons.info_rounded, color: AppColors.graniteGray, size: 17),
        SizedBox(width: 8),
        Expanded(
          child: AppTextMicro(
            text:
                "Anda dapat menggunakan dompet elektronik atau aplikasi perbankan seluler apa pun yang didukung",
          ),
        ),
      ],
    );

    final announcement = Container(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [information]),
          SizedBox(height: 10),
          note,
        ],
      ),
    );

    final qrisHeader = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 68,
          height: 29,
          child: Image.asset(AppAssets.qris, width: 68, height: 29),
        ),
        SizedBox(
          width: 53,
          height: 32,
          child: Image.asset(AppAssets.gpn, width: 53, height: 32),
        ),
      ],
    );

    final qris = Container(
      height: 523,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: AppColors.brandeisBlue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          qrisHeader,
          SizedBox(height: 15),
          AppTextH3SemiBold(text: "Taekwondo Indonesia", color: Colors.white),
          AppTextH3SemiBold(text: "NMID: ID123456889D0T9", color: Colors.white),
          SizedBox(height: 12),
          Container(
            width: 253,
            height: 253,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: Image.asset(AppAssets.taekwondoQr, width: 223, height: 223),
          ),
        ],
      ),
    );

    final totalContainer = Container(
      height: 126,
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 21),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.background,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextH4(text: "Total"),
              AppTextH4SemiBold(text: "Rp 200,000.00"),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                icon: Icon(Icons.share),
                label: Text('Bagikan'),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                icon: Icon(Icons.download_for_offline_outlined),
                label: Text('Download'),
              ),
            ],
          ),
        ],
      ),
    );

    final qrisInformation = Column(
      children: [announcement, SizedBox(height: 10), qris],
    );

    final payment = Stack(
      children: [
        qrisInformation,
        Positioned(bottom: 0, left: 0, right: 0, child: totalContainer),
      ],
    );

    return Column(
      children: [
        payment,
        SizedBox(height: 28),
        InkWell(
          onTap: () {},
          child: AppTextParagraphSemiBold(
            text: "Lihat Instruksi Pembayaran",
            color: AppColors.brandeisBlue,
          ),
        ),
      ],
    );
  }
}
