import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  final Function handler;

  Answer({
    @required String answer,
    @required Function handler
  }) :
        answer = answer,
        handler = handler;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(answer),
        onPressed: handler,
      ),
    );
  }
}
