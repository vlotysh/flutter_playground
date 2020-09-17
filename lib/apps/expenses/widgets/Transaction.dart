import 'package:flutter/material.dart';
import 'package:playground/apps/expenses/entities/Transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction _transaction;

  TransactionCard(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              _transaction.amount.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.red,
              )
            ),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 2)),
            padding: EdgeInsets.all(10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  _transaction.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Color.fromRGBO(60, 60, 60, 0.8)),
                ),
              ),
              Container(
                  child: Text("${_transaction.date.year.toString()}"
                      "-${_transaction.date.month.toString().padLeft(2, '0')}"
                      "-${_transaction.date.day.toString().padLeft(2, '0')}"))
            ],
          )
        ],
      ),
      elevation: 0,
    );
  }
}
