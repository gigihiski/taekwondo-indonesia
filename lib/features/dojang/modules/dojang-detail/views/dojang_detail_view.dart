import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_search.dart';
import 'package:taekwondo/core/services/dojang/models/dojang.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class DojangDetailView extends StatefulWidget {
  const DojangDetailView({super.key, required this.dojang});

  final Dojang dojang;

  @override
  DojangDetailViewState createState() => DojangDetailViewState();
}

class DojangDetailViewState extends State<DojangDetailView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget header = AppSearch(
      hint: L10n.localizations(context).search_event,
      color: Colors.grey.shade100,
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.white,
      child: Container(),
    );
  }
}
