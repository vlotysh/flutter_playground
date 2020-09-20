import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:playground/apps/expenses/entities/Transaction.dart';
import 'package:playground/apps/expenses/widgets/ChartItem.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      // for (vat i = 0; i < recentTransactions.length; i++) {
      for (Transaction transaction in recentTransactions) {
        if (transaction.date.day == weekDay.day &&
            transaction.date.month == weekDay.month &&
            transaction.date.year == weekDay.year) {
          totalSum += transaction.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupTransactionValues.fold(0.0, (sum, data) {
      return sum + data['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          elevation: 6,
          margin: EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ...groupTransactionValues.map((item) {
                  return Expanded(
                   // fit: FlexFit.tight, Expend == Flexible with 'fit: FlexFit.tight'
                    child: ChartItem(
                        item['day'],
                        item['amount'],
                        maxSpending == 0.0 ? 0.0 : (item['amount'] as double) / maxSpending
                    ),
                  );
                })
              ],
            ),
          ),
        ),
        width: double.infinity);
  }
}
