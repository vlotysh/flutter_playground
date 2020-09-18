import 'package:flutter/foundation.dart';

class Transaction {
  String id;
  double amount;
  String title;
  DateTime date;

  Transaction(
      {this.id,
      @required this.amount,
      @required this.title,
      @required this.date});
}
