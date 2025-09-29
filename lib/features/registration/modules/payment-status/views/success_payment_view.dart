import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class SuccessPaymentView extends StatefulWidget {
  const SuccessPaymentView({super.key});

  @override
  SuccessPaymentViewState createState() => SuccessPaymentViewState();
}

class SuccessPaymentViewState extends State<SuccessPaymentView> {
  @override
  Widget build(BuildContext context) {
    final image = SizedBox(
      width: 159,
      height: 150,
      child: Image.asset(AppAssets.success, fit: BoxFit.cover),
    );

    final statusInformation = Column(
      children: [
        AppTextCaptionSemiBold(text: "Transfer Berhasil"),
        SizedBox(height: 5),
        AppTextH4SemiBold(text: "Rp 200,000.00"),
      ],
    );

    final receiptheaderInformation = Padding(
      padding: EdgeInsets.symmetric(horizontal: 19, vertical: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppAssets.logo, width: 52, height: 52),
          AppTextCaption(text: "ID Transaksi #9877659022"),
        ],
      ),
    );

    Widget item(String title, String value) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextCaption(text: title, color: Colors.grey),
            AppTextCaption(text: value, color: Colors.black),
          ],
        ),
      );
    }

    final receiptInformation = Padding(
      padding: EdgeInsets.symmetric(horizontal: 19, vertical: 11),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          item("Metode Transaksi", "QRIS"),
          item("Nama Merchant", "Taekwondo Indonesia"),
          item("Lokasi Merchant", "Jakarta"),
          item("Waktu", "10:00 WIB"),
          item("Tanggal Pembelian", "22 Sept 2025"),
          item("Terminal ID", "Q 23"),
          item("Merchant PAN", "99988299987790"),
          item("Customer PAN", "869382084811111334234"),
        ],
      ),
    );

    final action = Row(
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
    );

    final content = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.background,
      ),
      child: Column(
        children: [
          receiptheaderInformation,
          Divider(thickness: 2, color: AppColors.platinum),
          receiptInformation,
        ],
      ),
    );

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            image,
            SizedBox(height: 22),
            statusInformation,
            SizedBox(height: 25),
            content,
            SizedBox(height: 25),
            action,
          ],
        ),
      ),
    );
  }
}
