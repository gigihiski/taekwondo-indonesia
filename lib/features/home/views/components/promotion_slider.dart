import 'package:flutter/material.dart';

class PromotionSlider extends StatelessWidget {
  const PromotionSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final content = SizedBox(
      height: 174,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return PromotionCard(
            background: AssetImage('assets/images/promotion_${index + 1}.png'),
          );
        },
      ),
    );

    return SizedBox(
      width: double.infinity,
      child: content,
    );
  }
}

class PromotionCard extends StatelessWidget {
  const PromotionCard({
    super.key,
    required this.background,
  });

  final ImageProvider background;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 174,
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: background,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
