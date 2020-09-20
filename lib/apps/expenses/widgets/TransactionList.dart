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
        ? Container(
            height: 400,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              itemCount: transactions.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return TransactionCard(transactions[index], removeTransaction);
              },
            ))
        : Column(
            children: <Widget>[
              Text('No transaction!'),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: Image.asset('assets/image/waiting.png', fit: BoxFit.cover),
              )
            ],
    );
  }
}
