import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';

class FlashSaleCountDownTimer extends StatefulWidget {
  const FlashSaleCountDownTimer({
    super.key,
    required this.seconds,
    required this.onTimerEnded,
  });

  final int seconds;
  final Function() onTimerEnded;

  @override
  State<FlashSaleCountDownTimer> createState() =>
      FlashSaleCountDownTimerState();
}

class FlashSaleCountDownTimerState extends State<FlashSaleCountDownTimer> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Duration>(
      duration: Duration(seconds: widget.seconds),
      tween: Tween(
        begin: Duration(seconds: widget.seconds),
        end: Duration.zero,
      ),
      onEnd: widget.onTimerEnded,
      builder: (BuildContext context, Duration value, Widget? child) {
        final hours = value.inHours;
        final minutes = value.inMinutes % 60;
        final seconds = value.inSeconds % 60;
        return AppTextCaptionSemiBold(
          text:
              '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
        );
      },
    );
  }
}
