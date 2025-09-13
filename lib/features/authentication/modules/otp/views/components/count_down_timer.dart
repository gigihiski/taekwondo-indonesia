import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    super.key,
    required this.seconds,
    required this.onTimerEnded,
  });

  final int seconds;
  final Function() onTimerEnded;

  @override
  State<CountDownTimer> createState() => CountDownTimerState();
}

class CountDownTimerState extends State<CountDownTimer> {
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
        final minutes = value.inMinutes;
        final seconds = value.inSeconds % 60;
        return AppTextParagraphSemiBold(
          text:
              '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
          color: Colors.white,
        );
      },
    );
  }
}
