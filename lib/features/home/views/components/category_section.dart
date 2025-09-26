import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_header.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/features/home/modules/home/models/category.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.categories,
    required this.onPressed,
  });

  final List<Category> categories;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final header = AppHeaderTitle(text: L10n.localizations(context).category);

    final content = SizedBox(
      height: 90,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: Column(
            children: [
              Container(
                width: 70,
                height: 70,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Image.asset(categories[index].icon, color: Colors.white),
              ),
              SizedBox(height: 5),
              AppTextCaptionSemiBold(text: categories[index].name),
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 10),
      ),
    );

    return Column(children: [header, SizedBox(height: 19), content]);
  }
}
