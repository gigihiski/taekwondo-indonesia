import 'package:flutter/cupertino.dart';
import 'package:taekwondo/core/components/app_margin.dart';
import 'package:taekwondo/core/services/transaction/models/transaction.dart';
import 'package:taekwondo/features/home/modules/transaction-list/views/components/transaction_item.dart';

class TransactionListView extends StatefulWidget {
  const TransactionListView({super.key, required this.transactions});

  final List<Transaction> transactions;

  @override
  TransactionListViewState createState() => TransactionListViewState();
}

class TransactionListViewState extends State<TransactionListView> {
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
    return AppMargin(
      child: ListView.separated(
        itemBuilder: (context, index) => TransactionItem(),
        separatorBuilder: (context, index) => SizedBox(height: 15),
        itemCount: 5,
      ),
    );
  }
}
