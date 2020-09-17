import 'package:flutter/material.dart';
import 'package:playground/apps/expenses/entities/Transaction.dart';
import 'package:playground/apps/expenses/widgets/Transaction.dart';

class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 'td1', amount: 23.99, title: 'Milk', date: DateTime.now()),
    Transaction(id: 'td2', amount: 12.99, title: 'Apple', date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expanses'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                child: Card(
                  color: Colors.blue,
                  child: Text('CHART'),
                  elevation: 5,
                ),
                width: double.infinity),
            Column(
                children: transactions.map((transaction) {
              return TransactionCard(transaction);
            }).toList())
          ],
        ));
  }
}
