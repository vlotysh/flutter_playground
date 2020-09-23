import 'dart:math';

import 'package:flutter/material.dart';
import 'package:playground/apps/expenses/entities/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatefulWidget {
  final Transaction transaction;
  final Function deleteHandler;

  TransactionCard({
      Key key,
      @required this.transaction,
      @required this.deleteHandler
  }): super(key: key);

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  Color _bgColor;
  
  @override
  void initState() {
    List bgColors = [
      Colors.red,
      Colors.blue,
      Colors.black,
      Colors.purple
    ];

    _bgColor = bgColors[Random().nextInt(bgColors.length)];

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 6,
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: _bgColor,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text(
                  '\$' + widget.transaction.amount.toStringAsFixed(2),
                ),
              ),
            )),
        title: Container(
          child: Text(
            widget.transaction.title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        subtitle: Container(
            child:
                Text('${DateFormat('yyyy-MM-dd').format(widget.transaction.date)}')),
        trailing: mediaQuery.size.width > 360 // o
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                onPressed: () => widget.deleteHandler(widget.transaction.id),
                icon: Icon(Icons.delete),
                label: Text('Remove'))
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteHandler(widget.transaction.id),
              ),
      ),
    );
  }
}
