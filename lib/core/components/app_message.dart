import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_button.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/themes/app_fonts.dart';

class AppMessage extends StatelessWidget {
  const AppMessage({
    super.key,
    required this.title,
    required this.description,
    required this.onBackButtonPressed,
    this.buttonBack = 'Back',
  });

  final String title;
  final String description;

  final String buttonBack;
  final Function() onBackButtonPressed;

  void openAnimatedDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (context, animation1, animation2, widget) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0.0, -1.0),
            end: Offset.zero,
          ).animate(animation1),
          child: Dialog(
            insetPadding: EdgeInsets.only(left: 16, right: 16),
            backgroundColor: Colors.transparent,
            child: SizedBox(
              height: 364,
              width: double.infinity,
              child: AppMessage(
                title: title,
                description: description,
                onBackButtonPressed: onBackButtonPressed,
                buttonBack: buttonBack,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final titleText = Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: AppFonts.plusJakartaSans,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
    );

    final descriptionText = Text(
      description,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: AppFonts.plusJakartaSans,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );

    final button = SizedBox(
      width: 160,
      height: 50,
      child: AppButtonMedium(
        title: buttonBack,
        onPressed: () {
          Navigator.of(context).pop();
          onBackButtonPressed();
        },
        textColor: Colors.white,
      ),
    );

    final information = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        titleText,
        SizedBox(height: 10),
        descriptionText,
        SizedBox(height: 20),
        button,
      ],
    );

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [information, Image.asset(AppAssets.logo, width: 150)],
        ),
      ),
    );
  }
}

class AppConfirmation extends StatelessWidget {
  const AppConfirmation({
    super.key,
    required this.title,
    required this.description,
    this.buttonCancel = 'Cancel',
    this.buttonProceed = 'Yes',
    this.onProceed,
  });

  final String title;
  final String description;

  final String buttonCancel;
  final String buttonProceed;

  final Function()? onProceed;

  void openAnimatedDialog(BuildContext rootContext) {
    showGeneralDialog(
      context: rootContext,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (context, animation1, animation2, widget) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0.0, -1.0),
            end: Offset.zero,
          ).animate(animation1),
          child: Dialog(
            insetPadding: EdgeInsets.only(left: 16, right: 16),
            backgroundColor: Colors.transparent,
            child: SizedBox(
              height: 400,
              width: double.infinity,
              child: AppConfirmation(
                title: title,
                description: description,
                buttonCancel: buttonCancel,
                buttonProceed: buttonProceed,
                onProceed: () {
                  Navigator.of(context).pop();
                  return onProceed!();
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final titleText = Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: AppFonts.plusJakartaSans,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
    );

    final descriptionText = Text(
      description,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: AppFonts.plusJakartaSans,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );

    final buttons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: AppButtonMedium(
              title: buttonCancel,
              onPressed: () => Navigator.pop(context),
              appButtonColor: AppButtonColor(color: EnAppButtonColor.secondary),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: SizedBox(
            height: 50,
            child: AppButtonMedium(
              title: buttonProceed,
              onPressed: () => onProceed!(),
              textColor: Colors.white,
            ),
          ),
        ),
      ],
    );

    final information = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        titleText,
        SizedBox(height: 10),
        descriptionText,
        SizedBox(height: 20),
        buttons,
      ],
    );

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [information, Image.asset(AppAssets.logo, width: 213)],
        ),
      ),
    );
  }
}
