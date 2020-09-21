import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:playground/apps/expenses/widgets/AdaptiveFlatButton.dart';

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
  bool _showIOSDatePicker = false;

  _submitData() {
    final enteredText = _titleController.text;
    final enteredAmount = double.parse(
        _amountController.text.isEmpty ? 0 : _amountController.text);


    if (enteredAmount <= 0 || enteredText.isEmpty || _selectedDate == null) {
      return;
    }

    widget.createTransaction(
        _titleController.text, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    if (Platform.isIOS) {
      setState(() {
        _showIOSDatePicker = true;
      });

      return;
    }
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

  _closeDatePicker() {
    setState(() {
      _showIOSDatePicker = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  10), //Bottom with keyboard
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Platform.isIOS
                  ? CupertinoTextField(
                      placeholder: 'title',
                      controller: _titleController,
                // onSubmitted: (_) => _submitData(),
                    )
                  : TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                     // onSubmitted: (_) =>
                     //     _submitData(), // _ underscore "I don't use arguments"
                    ),
              Platform.isIOS
                  ? CupertinoTextField(
                      placeholder: 'amount',
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                //  onSubmitted: (_) => _submitData(),
                    )
                  : TextField(
                      controller: _amountController,
                      decoration: InputDecoration(
                        labelText: 'Amount',
                      ),
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => _submitData(),
                    ),
              if (!_showIOSDatePicker) Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Date selected'
                          : 'Selected Date: ${DateFormat.yMd().format(_selectedDate)}'),
                    ),
                    AdaptiveFlatButton('Chose date', _presentDatePicker)
                  ],
                ),
              ),
              if (_showIOSDatePicker) Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).copyWith().size.height / 3,
                    child: CupertinoDatePicker(
                      minimumDate: DateTime(2019),
                      maximumDate: DateTime(2100),
                      initialDateTime:
                      _selectedDate == null ? DateTime.now() : _selectedDate,
                      onDateTimeChanged: (DateTime date) {
                        if (date == null) {
                          return;
                        }

                        setState(() {
                          _selectedDate = date;
                        });
                      },
                    ),
                  ),
                  AdaptiveFlatButton('Close date picker', _closeDatePicker)
                ],
              ),
              if (!_showIOSDatePicker) RaisedButton(
                child: Text('Save'),
                textColor: Theme.of(context).textTheme.button.color,
                color: Theme.of(context).primaryColor,
                onPressed: _submitData, // _ underscore "I don't use arguments"
              )
            ],
          ),
        ),
      ),
    );
  }
}
