import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/models/language.dart';
import 'package:taekwondo/core/services/language/logics/active_language_cubit.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({
    super.key,
    required this.languages,
    required this.activeLanguage,
  });

  final List<Language> languages;
  final Language activeLanguage;

  @override
  LanguageViewState createState() => LanguageViewState();
}

class LanguageViewState extends State<LanguageView> {
  late Language activeLanguage;

  @override
  void initState() {
    activeLanguage = widget.activeLanguage;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget languageOption(BuildContext context, int index, bool isActive) {
    return InkWell(
      onTap: () async {
        final language = Language(
          icon: widget.languages[index].icon,
          name: widget.languages[index].name,
          code: widget.languages[index].code,
        );
        await context.read<ActiveLanguageCubit>().setLanguage(language);
        setState(() {
          activeLanguage = language;
        });
      },
      child: ListTile(
        leading: SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset(widget.languages[index].icon),
        ),
        title: AppTextParagraphSemiBold(text: widget.languages[index].name),
        trailing: SizedBox(
          width: 15,
          height: 15,
          child: isActive ? Icon(Icons.check_circle_sharp) : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final options = ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: widget.languages.length,
      itemBuilder: (context, index) {
        bool active = (widget.languages[index].code == activeLanguage.code)
            ? true
            : false;
        return languageOption(context, index, active);
      },
      separatorBuilder: (context, index) =>
          Divider(height: 0.5, color: AppColors.platinum),
    );

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: options,
      ),
    );
  }
}
