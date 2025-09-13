import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class AppCounterButton extends StatefulWidget {
  const AppCounterButton({
    super.key,
    this.counter = 0,
    this.min = 0,
    this.max = 999999,
    this.counterColor = Colors.black,
    required this.onChanged,
  });

  final int counter;
  final int min;
  final int max;
  final Color counterColor;
  final Function(int) onChanged;

  @override
  State<AppCounterButton> createState() => AppCounterButtonState();
}

class AppCounterButtonState extends State<AppCounterButton> {
  late int counter;

  @override
  void initState() {
    counter = widget.counter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inc = ElevatedButton(
      onPressed: () {
        setState(() {
          if (counter < widget.max) {
            counter++;
            widget.onChanged(counter);
          }
        });
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        shape: CircleBorder(),
        side: BorderSide(color: AppColors.platinum),
        backgroundColor: Colors.white,
      ),
      child: Icon(Icons.add, size: 10),
    );
    final dec = ElevatedButton(
      onPressed: () {
        setState(() {
          if (counter <= widget.max) {
            if (counter > 0) {
              counter--;
              widget.onChanged(counter);
            }
          }
        });
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        shape: CircleBorder(),
        side: BorderSide(color: AppColors.platinum),
        backgroundColor: Colors.white,
      ),
      child: Icon(Icons.remove, size: 10),
    );

    return SizedBox(
      width: 112,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 32, height: 32, child: dec),
          Expanded(
            child: AppTextH4SemiBold(
              text: counter.toString(),
              textAlign: TextAlign.center,
              color: widget.counterColor,
            ),
          ),
          SizedBox(width: 32, height: 32, child: inc),
        ],
      ),
    );
  }
}
