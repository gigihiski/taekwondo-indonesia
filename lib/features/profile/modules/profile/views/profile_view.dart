import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taekwondo/core/components/app_message.dart';
import 'package:taekwondo/core/components/app_navigator.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/models/user.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/features/profile/models/profile_menu.dart';
import 'package:taekwondo/features/profile/modules/language/views/language_page.dart';
import 'package:taekwondo/features/profile/modules/profile/logics/profile_cubit.dart';
import 'package:taekwondo/features/webview/views/webview_page.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    final List<ProfileMenu> profileMenus = [
      ProfileMenu(
        icon: AppAssets.help,
        title: L10n.localizations(context).help,
      ),
      ProfileMenu(
        icon: AppAssets.language,
        title: L10n.localizations(context).language_setting,
      ),
      ProfileMenu(
        icon: AppAssets.notification,
        title: L10n.localizations(context).notification_setting,
      ),
      ProfileMenu(
        icon: AppAssets.privacyPolicy,
        title: L10n.localizations(context).privacy_policy,
      ),
      ProfileMenu(
        icon: AppAssets.termsConditions,
        title: L10n.localizations(context).terms_conditions,
      ),
      ProfileMenu(
        icon: AppAssets.about,
        title: L10n.localizations(context).about_us,
      ),
      ProfileMenu(
        icon: AppAssets.logout,
        title: L10n.localizations(context).logout,
      ),
    ];

    final menus = Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: profileMenus.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              switch (index) {
                case 0:
                  AppNavigator(
                    context: context,
                    page: WebviewPage(
                      title: L10n.localizations(context).help,
                      url: "https://taekwondo.or.id",
                    ),
                    route: WebviewPage.routeSettings,
                  ).push();
                  break;
                case 1:
                  AppNavigator(
                    context: context,
                    page: LanguagePage(),
                    route: LanguagePage.routeSettings,
                  ).push();
                  break;
                case 2:
                  break;
                case 3:
                  AppNavigator(
                    context: context,
                    page: WebviewPage(
                      title: L10n.localizations(context).privacy_policy,
                      url: "https://taekwondo.or.id",
                      isShowBar: true,
                    ),
                    route: WebviewPage.routeSettings,
                  ).push();
                case 4:
                  AppNavigator(
                    context: context,
                    page: WebviewPage(
                      title: L10n.localizations(context).terms_conditions,
                      url: "https://taekwondo.or.id",
                      isShowBar: true,
                    ),
                    route: WebviewPage.routeSettings,
                  ).push();
                case 5:
                  AppNavigator(
                    context: context,
                    page: WebviewPage(
                      title: L10n.localizations(context).about_us,
                      url: "https://taekwondo.or.id",
                      isShowBar: true,
                    ),
                    route: WebviewPage.routeSettings,
                  ).push();
                case 6:
                  AppConfirmation(
                    title: L10n.localizations(context).logout,
                    description: L10n.localizations(
                      context,
                    ).logout_confirmation,
                    buttonCancel: L10n.localizations(context).no,
                    buttonProceed: L10n.localizations(context).yes,
                    onProceed: () {
                      context.read<ProfileCubit>().logout();
                    },
                  ).openAnimatedDialog(context);
                  break;
              }
            },
            child: ListTile(
              leading: SizedBox(
                width: 24,
                height: 24,
                child: SvgPicture.asset(
                  profileMenus[index].icon,
                  colorFilter: ColorFilter.mode(
                    AppColors.graniteGray,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              title: AppTextParagraphSemiBold(
                text: profileMenus[index].title,
                color: AppColors.graniteGray,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) =>
            Divider(height: 0.5, color: AppColors.platinum),
      ),
    );

    final information = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 80,
          child: AppTextH2SourGummySemiBold(
            text: L10n.localizations(context).daily_quest,
            color: AppColors.primary,
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: AppTextCaption(
            text: L10n.localizations(context).daily_quest_instruction,
          ),
        ),
        SizedBox(width: 15),
        SizedBox(width: 89, height: 90, child: Image.asset(AppAssets.logo)),
      ],
    );

    final header = Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.platinum, width: 1),
        gradient: RadialGradient(
          colors: [AppColors.secondary, Colors.white],
          center: Alignment(-0.5, -1.6),
          radius: 0.8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [information],
      ),
    );

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [header, SizedBox(height: 12), menus],
        ),
      ),
    );
  }
}
