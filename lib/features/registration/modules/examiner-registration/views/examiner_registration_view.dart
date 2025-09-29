import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/features/registration/modules/examiner-registration/views/components/examiner_address.dart';
import 'package:taekwondo/features/registration/modules/examiner-registration/views/components/examiner_personal.dart';
import 'package:taekwondo/features/registration/modules/payment/views/payment_view.dart';

class ExaminerRegistrationView extends StatefulWidget {
  const ExaminerRegistrationView({super.key});

  @override
  ExaminerRegistrationViewState createState() =>
      ExaminerRegistrationViewState();
}

class ExaminerRegistrationViewState extends State<ExaminerRegistrationView> {
  int activeStep = 0;
  final List<String> stepTitles = ['Personal', 'Pengalaman', 'Pembayaran'];

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
        return ExaminerPersonal();
      case 1:
        return ExaminerAddress();
      case 2:
        return PaymentView();
      default:
        return ExaminerPersonal();
    }
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
