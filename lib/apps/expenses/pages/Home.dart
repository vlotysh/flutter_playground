import 'package:flutter/material.dart';
import 'package:playground/apps/expenses/widgets/Chart.dart';
import 'package:playground/apps/expenses/widgets/UserTransactions.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expanses'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[Chart(), UserTransactions()],
          ),
        ));
  }
}
