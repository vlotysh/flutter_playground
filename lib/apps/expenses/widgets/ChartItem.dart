import 'package:flutter/material.dart';

class ChartItem extends StatelessWidget {
  final String lable;
  final double spedingAmount;
  final double spedingPctOfTotal;

  ChartItem(this.lable, this.spedingAmount, this.spedingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
                '\$${spedingAmount.toStringAsFixed(0)}',
            ),
          ),
        ),
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              FractionallySizedBox(
                heightFactor: spedingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(lable)
      ],
    );
  }
}
