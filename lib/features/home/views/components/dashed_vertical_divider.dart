import 'package:flutter/material.dart';

class DashedLineVerticalPainter extends CustomPainter {
  DashedLineVerticalPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.width;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DashedLineHorizontalPainter extends CustomPainter {
  DashedLineHorizontalPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5, dashSpace = 3, startX = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DashedVerticalDivider extends StatelessWidget {
  const DashedVerticalDivider({
    super.key,
    this.size = const Size(
      1,
      double.infinity,
    ),
    this.color = Colors.white,
  });

  final Size size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: DashedLineVerticalPainter(color: color),
    );
  }
}

class DashedHorizontalDivider extends StatelessWidget {
  const DashedHorizontalDivider({
    super.key,
    this.size = const Size(
      double.infinity,
      1,
    ),
    this.color = Colors.white,
  });

  final Size size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: DashedLineHorizontalPainter(color: color),
    );
  }
}
