import 'package:flutter/material.dart';
import './question.dart';

class QuizTask extends StatefulWidget {
  @override
  _QuizTaskState createState() => _QuizTaskState();
}

class _QuizTaskState extends State<QuizTask> {
  String answer = 'The question';
  int _questionIndex = 0;

  List<String> _questions = [
    'First question',
    'Second question'
  ];


  void _pressedHandler(String answer) {
    int newIndex = this._questionIndex + 1;

    if (this._questions.asMap().containsKey(newIndex)) {
      this._questionIndex += newIndex;
    } else {
      this._questionIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: Column(
          children: <Widget>[
            Question(
                questionText: this._questions[this._questionIndex]
            ),
            RaisedButton(
                child: Text('Answer 1'),
                onPressed: () {
                  setState(()  {
                    this._pressedHandler('Answer 1');
                  });
                },
            ),
            RaisedButton(
                child: Text('Answer 2'),
                onPressed: () {
                  setState(() {
                    this._pressedHandler('Answer 2');
                  });
                },
            ),
            RaisedButton(
                child: Text('Answer 3'),
                onPressed: () {
                  setState(() {
                    this._pressedHandler('Answer 3');
                  });
                },
            ),
          ],
        ),
      ),
    );
  }
}