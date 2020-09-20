import 'package:flutter/material.dart';
import 'package:playground/apps/expenses/entities/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction _transaction;
  final Function _deleteHandler;

  TransactionCard(this._transaction, this._deleteHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 6,
      child: ListTile(
        leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Text(
                  '\$' + _transaction.amount.toStringAsFixed(2),
                ),
              ),
            )),
        title: Container(
          child: Text(
            _transaction.title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        subtitle: Container(
            child:
                Text('${DateFormat('yyyy-MM-dd').format(_transaction.date)}')),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => _deleteHandler(_transaction.id),
        ),
      ),
    );
  }
}
