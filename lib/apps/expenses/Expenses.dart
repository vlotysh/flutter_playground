import 'package:flutter/material.dart';
import 'package:playground/apps/expenses/pages/Home.dart';

class Expenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.red,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold
            ),
          button: TextStyle(color: Colors.white)
        ),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(
              fontFamily: 'OpenSans', fontSize: 20
            ))
        )
      ),
      home: HomePage(),
    );
  }
}
