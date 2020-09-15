import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetHandler;
  final int totalScore;

  Result({
    @required Function resetHandler,
    @required int totalScore
  }) :
        resetHandler = resetHandler,
        totalScore = totalScore;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Text(
              'That\'s all! Your score $totalScore',
              style: TextStyle(fontSize: 28),
              textAlign: TextAlign.center
          ),
        ),
        Container(
          width: double.infinity,
          child: FlatButton(
            color: Colors.blue,
            child: Text(
                'Run again!'
            ),
            onPressed: resetHandler
          ),
        ),
      ],
    );
  }
}
