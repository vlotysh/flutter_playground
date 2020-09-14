import 'dart:io';

import 'package:flutter/material.dart';



class TestBody extends StatefulWidget {
  TestBody({Key key, this.counter}) : super(key: key);

  final String counter;

  @override
  _TestBodyState createState() => _TestBodyState();
}


class _TestBodyState extends State<TestBody> {
  String dropdownValue = 'Free';
  int rating = 2;
    @override
  Widget build(BuildContext context) {
      var list = <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Row(
            children: <Widget>[
              Text('Map'),
              Icon(Icons.remove_circle),
            ],
          ),
          selected: true,
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Album'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Phone'),
        )
      ];

      Color color;
      List<Widget>stars = [];

      for(int i = 1; i <= 5; i++) {
        color = Colors.black;

        if (i <= rating) {
          color = Colors.green[500];
        }

        stars.add(IconButton(
          icon: Icon(Icons.star, color: color),
          padding: const EdgeInsets.only(left: 0.0),
          onPressed: () {
            setState(() {
              this.ratingHandler(i);
            });
          },
        ));
      }

      var starsRow = Row(
        mainAxisSize: MainAxisSize.min,
        children: stars,
      );

      return Column(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton<String>(
                    value: this.dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                        color: Colors.deepPurple
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    })
                        .toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        this.dropdownValue = newValue;
                      });

                    },
                  ),
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    widget.counter,
                    style: Theme.of(context).textTheme.display1,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        starsRow,
                        Text(
                          '170 Reviews',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Roboto',
                            letterSpacing: 0.5,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 200.0,
                          child: ListView(
                              children: list
                          ),
                        ),
                      ),
                      new IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () {},
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  new Row(
                    children: <Widget>[
                      new IconButton(
                        icon: Icon(Icons.indeterminate_check_box),
                        onPressed: () {
                          setState(() {
                            if (this.rating > 0) {
                              this.rating -= 1;
                            }
                          });
                        },
                      ),
                      new IconButton(
                        icon: Icon(Icons.add_box),
                        onPressed: () {
                          setState(() {
                            if (this.rating <= 5) {
                              this.rating += 1;
                            }
                          });
                        },
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  )
                ],
              ),
            )
          ]
      );
    }

    ratingHandler(int starIndex) {
        this.rating = starIndex;
    }
}