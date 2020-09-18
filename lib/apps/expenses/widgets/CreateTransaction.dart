import 'package:flutter/material.dart';

class CreateTransaction extends StatefulWidget {
  Function createTransaction;

  CreateTransaction(this.createTransaction);

  @override
  _CreateTransactionState createState() => _CreateTransactionState(this.createTransaction);
}

class _CreateTransactionState extends State<CreateTransaction> {
  Function createTransaction;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  _CreateTransactionState(this.createTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  labelText: 'Title',
              ),
              onChanged: (String value) {
                  //Title = value;
              },
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                  labelText: 'Amount',
              ),
              onChanged: (String value) {
                //Amount = value;
              },
            ),
            FlatButton(
              child: Text('Add transaction'),
              textColor: Colors.purple,
              onPressed: () {
                createTransaction(titleController.text, double.parse(amountController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
