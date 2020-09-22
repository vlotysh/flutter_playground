import 'package:flutter/material.dart';
import 'package:playground/apps/expenses/entities/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final Function deleteHandler;

  TransactionCard({
      Key key,
      @required this.transaction,
      @required this.deleteHandler
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 6,
      child: ListTile(
        leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text(
                  '\$' + transaction.amount.toStringAsFixed(2),
                ),
              ),
            )),
        title: Container(
          child: Text(
            transaction.title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        subtitle: Container(
            child:
                Text('${DateFormat('yyyy-MM-dd').format(transaction.date)}')),
        trailing: mediaQuery.size.width > 360
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                onPressed: () => deleteHandler(transaction.id),
                icon: Icon(Icons.delete),
                label: Text('Remove'))
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteHandler(transaction.id),
              ),
      ),
    );
  }
}
