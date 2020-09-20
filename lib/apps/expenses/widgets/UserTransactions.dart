import 'package:flutter/material.dart';
import 'package:playground/apps/expenses/entities/Transaction.dart';
import 'package:playground/apps/expenses/widgets/CreateTransaction.dart';
import 'package:playground/apps/expenses/widgets/TransactionList.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
       // CreateTransaction(_addNewTransaction),
       // TransactionList(_userTransactions, _removeTransaction)
      ],
    );
  }
}
