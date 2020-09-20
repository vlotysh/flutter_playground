import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateTransaction extends StatefulWidget {
  Function createTransaction;

  CreateTransaction(this.createTransaction);

  @override
  _CreateTransactionState createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  _submitData() {
    final enteredText = _titleController.text;
    final enteredAmount =
        double.parse(_amountController.text.isEmpty ? 0 : _amountController.text);

    if (enteredAmount <= 0 || enteredText.isEmpty || _selectedDate == null) {
      return;
    }

    widget.createTransaction(
        _titleController.text, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: _selectedDate == null ? DateTime.now() : _selectedDate,
            firstDate: DateTime(2019),
            lastDate: DateTime(2100))
        .then((value) {
      if (value == null) {
        return;
      }

      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onSubmitted: (_) =>
                  _submitData(), // _ underscore "I don't use arguments"
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child:
                      Text(_selectedDate == null
                          ? 'No Date selected'
                          : 'Selected Date: ${DateFormat.yMd().format(_selectedDate)}'),

                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text('Chose Date',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text('Save'),
              textColor: Theme.of(context).textTheme.button.color,
              color: Theme.of(context).primaryColor,
              onPressed: _submitData, // _ underscore "I don't use arguments"
            )
          ],
        ),
      ),
    );
  }
}
