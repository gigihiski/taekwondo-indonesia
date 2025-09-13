import 'package:flutter/material.dart';

class BundleBackground extends StatelessWidget {
  const BundleBackground({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BundleBackgroundClipper(),
      child: SizedBox(
        height: 222,
        width: 153,
      ),
    );
  }
}

class BundleBackgroundClipper extends CustomClipper<Path> {
  BundleBackgroundClipper();

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 128)
      ..quadraticBezierTo(size.width / 2, 128 - 128, 0, 128);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(BundleBackgroundClipper oldClipper) => true;
}
