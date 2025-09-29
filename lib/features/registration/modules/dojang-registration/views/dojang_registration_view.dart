import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/features/registration/modules/dojang-registration/views/components/dojang_address.dart';
import 'package:taekwondo/features/registration/modules/dojang-registration/views/components/dojang_management.dart';
import 'package:taekwondo/features/registration/modules/dojang-registration/views/components/dojang_personal.dart';
import 'package:taekwondo/features/registration/modules/payment/views/payment_page.dart';
import 'package:taekwondo/features/registration/modules/payment/views/payment_view.dart';

class DojangRegistrationView extends StatefulWidget {
  const DojangRegistrationView({super.key});

  @override
  DojangRegistrationViewState createState() => DojangRegistrationViewState();
}

class DojangRegistrationViewState extends State<DojangRegistrationView> {
  int activeStep = 0;
  final List<String> stepTitles = [
    'Personal',
    'Alamat',
    'Pengurus',
    'Pembayaran',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 120,
            child: EasyStepper(
              activeStep: activeStep,
              internalPadding: 0,
              showLoadingAnimation: false,
              stepRadius: 22,
              padding: EdgeInsets.zero,
              showStepBorder: false,
              lineStyle: LineStyle(
                lineType: LineType.normal,
                lineThickness: 2,
                finishedLineColor: Colors.blue,
                activeLineColor: Colors.blue,
                unreachedLineColor: AppColors.background,
              ),
              steps: List.generate(
                stepTitles.length,
                (index) => EasyStep(
                  topTitle: true,
                  customTitle: Center(
                    child: AppTextParagraphSemiBold(
                      text: stepTitles[index],
                      color: index <= activeStep ? Colors.blue : Colors.grey,
                    ),
                  ),
                  customStep: CircleAvatar(
                    radius: 35,
                    backgroundColor: index <= activeStep
                        ? Colors.blue
                        : AppColors.background,
                    child: AppTextH4SemiBold(
                      text: (index + 1).toString(),
                      color: index <= activeStep ? Colors.white : Colors.black,
                    ),
                  ),
                  customLineWidget: Container(
                    height: 3,
                    color: index <= activeStep
                        ? AppColors.primary
                        : AppColors.background,
                  ),
                ),
              ),
              onStepReached: (index) {
                setState(() {
                  activeStep = index;
                });
              },
            ),
          ),

          // Content Area
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: buildStepContent(),
          ),

          // Navigation Buttons
          Container(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: activeStep > 0 ? previousStep : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.background,
                    foregroundColor: Colors.white,
                  ),
                  child: AppTextCaptionSemiBold(
                    text: 'Sebelumnya',
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: activeStep < stepTitles.length - 1
                      ? nextStep
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: AppTextCaptionSemiBold(
                    text: 'Selanjutnya',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStepContent() {
    switch (activeStep) {
      case 0:
        return DojangPersonal();
      case 1:
        return DojangAddress();
      case 2:
        return DojangManagement();
      case 3:
        return PaymentView();
      default:
        return DojangPersonal();
    }
  }

  Widget buildStep2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Data Pribadi',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Silakan lengkapi data pribadi Anda:',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 15),
        ListTile(
          leading: Icon(Icons.person, color: Colors.green),
          title: Text('Nama Lengkap'),
          subtitle: Text('Isi dengan nama lengkap sesuai KTP'),
        ),
        ListTile(
          leading: Icon(Icons.email, color: Colors.green),
          title: Text('Email'),
          subtitle: Text('Alamat email yang aktif'),
        ),
        ListTile(
          leading: Icon(Icons.phone, color: Colors.green),
          title: Text('Nomor Telepon'),
          subtitle: Text('Nomor yang dapat dihubungi'),
        ),
      ],
    );
  }

  Widget buildStep3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Konfirmasi Data',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Harap periksa kembali data yang telah Anda isi:',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 20),
        Card(
          color: Colors.orange,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nama:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('John Doe'),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Email:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('john@example.com'),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Telepon:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('+62 812-3456-7890'),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Jika semua data sudah benar, klik "Selanjutnya" untuk melanjutkan.',
          style: TextStyle(fontSize: 14, color: AppColors.background),
        ),
      ],
    );
  }

  Widget buildStep4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check_circle, color: Colors.green, size: 80),
        SizedBox(height: 20),
        Text(
          'Pendaftaran Berhasil!',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Selamat! Proses pendaftaran Anda telah berhasil diselesaikan.',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          'Tim kami akan menghubungi Anda dalam 1x24 jam untuk verifikasi lebih lanjut.',
          style: TextStyle(fontSize: 14, color: AppColors.background),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              activeStep = 0;
            });
          },
          icon: Icon(Icons.refresh),
          label: Text('Mulai Lagi'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
        ),
      ],
    );
  }

  void nextStep() {
    setState(() {
      if (activeStep < stepTitles.length - 1) {
        activeStep++;
      }
    });
  }

  void previousStep() {
    setState(() {
      if (activeStep > 0) {
        activeStep--;
      }
    });
  }
}
