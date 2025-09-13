import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_header.dart';
import 'package:taekwondo/core/models/food_beverage.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class FoodBeverageSection extends StatelessWidget {
  const FoodBeverageSection({
    super.key,
    required this.title,
    required this.menus,
    required this.onPressed,
  });

  final String title;
  final List<FoodBeverage> menus;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final header = AppHeaderTitleLink(
      text: title,
      appHeaderLink: AppHeaderLink(
        text: L10n.localizations(context).view_all,
        onPressed: onPressed,
      ),
    );

    final content = GridView.builder(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.85,
      ),
      itemCount: menus.length,
      itemBuilder: (context, index) {
        // return InkWell(
        //   onTap: () {
        //     AppNavigator(
        //       context: context,
        //       page: ProductPage(menu: menus[index]),
        //       route: ProductPage.routeSettings,
        //     ).push();
        //   },
        //   child: AppFoodBeverageItem(menu: menus[index]),
        // );
        return Container();
      },
    );

    return Column(children: [header, SizedBox(height: 19), content]);
  }
}
