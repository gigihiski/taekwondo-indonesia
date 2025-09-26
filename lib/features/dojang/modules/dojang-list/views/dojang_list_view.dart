import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_navigator.dart';
import 'package:taekwondo/core/components/app_search.dart';
import 'package:taekwondo/core/services/dojang/models/dojang.dart';
import 'package:taekwondo/features/dojang/modules/dojang-detail/views/dojang_detail_page.dart';
import 'package:taekwondo/features/dojang/modules/dojang-list/views/components/dojang_item.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class DojangListView extends StatefulWidget {
  const DojangListView({super.key, required this.dojangs});

  final List<Dojang> dojangs;

  @override
  DojangListViewState createState() => DojangListViewState();
}

class DojangListViewState extends State<DojangListView> {
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
      child: Column(
        children: [
          SizedBox(height: 12),
          header,
          SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              primary: true,
              padding: EdgeInsets.zero,
              itemCount: widget.dojangs.length,
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  AppNavigator(
                    context: context,
                    page: DojangDetailPage(id: widget.dojangs[index].id),
                    route: DojangDetailPage.routeSettings,
                  ).push();
                },
                child: DojangItem(dojang: widget.dojangs[index]),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
