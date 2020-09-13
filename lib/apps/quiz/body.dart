import 'dart:io';

import 'package:flutter/material.dart';


// ignore: must_be_immutable
class TestBody extends StatelessWidget {
  String counter;
  String dropdownValue = 'Free';

  TestBody(String this.counter);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
      DropdownButton<String>(
      value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(
            color: Colors.deepPurple
        ),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        })
            .toList(),
        onChanged: (String newValue) {
          dropdownValue = newValue;
        },
      ),

          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            this.counter,
            style: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
    );
  }
}