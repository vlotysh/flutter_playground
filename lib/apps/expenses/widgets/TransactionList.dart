import 'dart:ui';

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
        ? ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            itemCount: transactions.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return TransactionCard(transactions[index], removeTransaction);
            },
          )
        : LayoutBuilder(
            builder: (ctx, constrains) {
              return Column(
                children: <Widget>[
                  Text('No transaction!', style: Theme.of(context).textTheme.title),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constrains.maxHeight * 0.6,
                    child: Image.asset('assets/image/waiting.png',
                        fit: BoxFit.cover),
                  )
                ],
              );
            },
          );
  }
}
