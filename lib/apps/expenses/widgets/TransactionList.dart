import 'package:flutter/material.dart';
import 'package:playground/apps/expenses/entities/Transaction.dart';
import 'package:playground/apps/expenses/widgets/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  TransactionList(this.transactions, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.length > 0
        ? Container(
            height: 300,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              itemCount: transactions.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                Transaction transaction = transactions[index];

                return TransactionCard(transaction, removeTransaction);
              },
            ))
        : Center(child: const Text('No transaction'));
  }
}
