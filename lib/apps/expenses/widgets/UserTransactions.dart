import 'package:flutter/material.dart';
import 'package:playground/apps/expenses/entities/Transaction.dart';
import 'package:playground/apps/expenses/widgets/CreateTransaction.dart';
import 'package:playground/apps/expenses/widgets/TransactionList.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 'td1', amount: 23.99, title: 'Milk', date: DateTime.now()),
    Transaction(id: 'td2', amount: 12.99, title: 'Apple', date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
      final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now()
      );
      
      setState(() {
        _userTransactions.add(newTx);
      });
  }

  void _removeTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CreateTransaction(_addNewTransaction),
        TransactionList(_userTransactions, _removeTransaction)
      ],
    );
  }
}
