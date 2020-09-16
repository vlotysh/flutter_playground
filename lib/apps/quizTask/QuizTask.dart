import 'package:playground/apps/quizTask/DTO/QuizDTO.dart';
import 'package:playground/apps/quizTask/quiz.dart';
import 'package:playground/apps/quizTask/result.dart';
import 'package:flutter/material.dart';

class QuizTask extends StatefulWidget {
  @override
  _QuizTaskState createState() => _QuizTaskState();
}

class _QuizTaskState extends State<QuizTask> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final _questions = [
    {
      'question': 'First question',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 3},
      ]
    },
    {
      'question': 'Second question',
      'answers': [
        {'text': 'Cat', 'score': 10},
        {'text': 'Dog', 'score': 5},
        {'text': 'Caw', 'score': 3},
      ]
    }
  ];

  void _pressedHandler(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void resetHandler() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  QuizDTO buildDTO() {
    return QuizDTO(
        _questions[_questionIndex]['question'],
        _questions[_questionIndex]['answers']
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: () {
          return _questionIndex < _questions.length
              ? QuizBlock(
                quizDTO: buildDTO(),
                pressedHandler: _pressedHandler
              )
              : Result(resetHandler: resetHandler, totalScore: _totalScore);
        }()
      ),
    );
  }
}