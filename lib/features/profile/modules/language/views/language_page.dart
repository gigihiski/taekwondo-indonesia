import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/core/services/storages/language_storage.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/features/profile/modules/language/logics/language_cubit.dart';
import 'package:taekwondo/features/profile/modules/language/views/language_view.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => LanguagePage());
  }

  static RouteSettings routeSettings = const RouteSettings(name: "language");

  @override
  State<LanguagePage> createState() => LanguagePageState();
}

class LanguagePageState extends State<LanguagePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider languageBlocProvider() {
      return BlocProvider<LanguageCubit>(
        create: (context) => LanguageCubit(LanguageStorage.create())..initial(),
      );
    }

    BlocListener languageBlocListener() {
      return BlocListener<LanguageCubit, LanguageState>(
        listener: (context, state) {},
      );
    }

    Widget Function(BuildContext, LanguageState) languageBlocBuilder() {
      return (context, state) {
        switch (state.status) {
          case LanguageStatus.initial:
          case LanguageStatus.error:
          case LanguageStatus.unAuthenticated:
            throw UnimplementedError();
          case LanguageStatus.loading:
            return Container();
          case LanguageStatus.loaded:
            return LanguageView(
              languages: state.languages,
              activeLanguage: state.activeLanguage,
            );
        }
      };
    }

    return MultiBlocProvider(
      providers: [languageBlocProvider()],
      child: MultiBlocListener(
        listeners: [languageBlocListener()],
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBarHeader(
            color: Colors.transparent,
            title: L10n.localizations(context).language_setting,
          ),
          body: BlocBuilder<LanguageCubit, LanguageState>(
            builder: languageBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
