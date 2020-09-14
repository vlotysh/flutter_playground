import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question({
    @required String questionText
  }) : questionText = questionText;
  /// <Note (class constructor)>
  /// When you  passing some values to object as named parameter,
  /// you have to
  /// </Note>
  ///
  /// <Note (double dot in constructor)>
  /// Syntax sugar. You can also use for example:
  ///
  /// Question({
  ///   String questionText
  ///  }) {
  ///     _questionText = questionText;
  ///  }
  ///  </Note>

  @override
  Widget build(BuildContext context) {
    return Container(
      /// <Note (class constructor)>
      /// Container is like div tag in html, can be like holder for widgets
      /// </Note>
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child:Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ));
  }
}
