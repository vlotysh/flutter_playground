import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          color: Colors.blue,
          child: Text('CHART'),
          elevation: 5,
        ),
        width: double.infinity
    );
  }
}
