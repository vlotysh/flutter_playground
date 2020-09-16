import 'package:playground/apps/quizTask/DTO/QuizDTO.dart';
import 'package:playground/apps/quizTask/answer.dart';
import 'package:playground/apps/quizTask/question.dart';
import 'package:flutter/material.dart';

class QuizBlock extends StatelessWidget {
  final QuizDTO quizDTO;
  final Function pressedHandler;

  QuizBlock({
    @required QuizDTO quizDTO,
    @required Function pressedHandler
  }) :
        quizDTO = quizDTO,
        pressedHandler = pressedHandler;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
            questionText: quizDTO.question
        ),
        // ignore: sdk_version_ui_as_code
        ...(quizDTO.answers as List<Map<String, Object>>).map((answer) {
          return Answer(
            answer: answer['text'],
            handler: () => pressedHandler(answer['score']),
          );
        }).toList()
      ],
    );
  }
}
