import 'package:flutter/material.dart';

class ChartItem extends StatelessWidget {
  final String lable;
  final double spedingAmount;
  final double spedingPctOfTotal;

  const ChartItem(this.lable, this.spedingAmount, this.spedingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constrains) {
        return Column(
          children: <Widget>[
            Container(
              height: constrains.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  '\$${spedingAmount.toStringAsFixed(0)}',
                ),
              ),
            ),
            SizedBox(height: constrains.maxHeight * 0.05),
            Container(
              height: constrains.maxHeight * 0.6,
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
            SizedBox(height: constrains.maxHeight * 0.04),
            Container(
                height: constrains.maxHeight * 0.15,
                child: FittedBox(
                    child: Text(lable)
                )
            )
          ],
        );
      },
    );
  }
}
