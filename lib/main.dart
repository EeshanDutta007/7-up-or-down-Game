import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  int diceR = 1;
  int diceL = 1;
  int sum = 0;
  change() {
    setState(() {
      diceR = Random().nextInt(6) + 1;
      diceL = Random().nextInt(6) + 1;
      sum = diceR + diceL;
    });
  }

  int a = -1, b = -1;
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.white,
            width: 5.0,
          )),
          child: Text('Gameeee',
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        ),
        SizedBox(
          height: 40.0,
        ),
        Row(
          children: [
            SizedBox(
              width: 60.0,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomLeft: Radius.circular(18))),
              elevation: 0,
              color: a == 0 ? Colors.white : Colors.red,
              child: Center(
                  child: Text('7 DOWN',
                      style: TextStyle(
                          color: a == 0 ? Colors.red : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15))),
              onPressed: () {
                setState(() {
                  a = 0;
                });
              },
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white),
              ),
              elevation: 0,
              color: a == 1 ? Colors.white : Colors.red,
              child: Center(
                  child: Text('7 IN',
                      style: TextStyle(
                          color: a == 1 ? Colors.red : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15))),
              onPressed: () {
                setState(() {
                  a = 1;
                });
              },
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      bottomRight: Radius.circular(18))),
              elevation: 0,
              color: a == 2 ? Colors.white : Colors.red,
              child: Center(
                  child: Text('7 UP',
                      style: TextStyle(
                          color: a == 2 ? Colors.red : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15))),
              onPressed: () {
                setState(() {
                  a = 2;
                });
              },
            ),
          ],
        ),
        SizedBox(
          height: 70.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  b = 0;
                  change();
                },
                child: Image.asset('images/dice$diceL.png'),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  b = 0;
                  change();
                },
                child: Image.asset('images/dice$diceR.png'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          padding: (a != 0 || b == -1) ? null : const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: (a != 0 || b == -1)
                  ? null
                  : Border.all(
                      color: Colors.white,
                      width: 5.0,
                    )),
          child: (a != 0 || b == -1)
              ? null
              : (a == 0 && sum < 7)
                  ? Text(
                      'Win',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    )
                  : Text(
                      'Lose',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
        ),
        Container(
          padding: (a != 1 || b == -1) ? null : const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: (a != 1 || b == -1)
                  ? null
                  : Border.all(
                      color: Colors.white,
                      width: 5.0,
                    )),
          child: (a != 1 || b == -1)
              ? null
              : (a == 1 && sum == 7)
                  ? Text(
                      'Win',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    )
                  : Text(
                      'Lose',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
        ),
        Container(
          padding: (a != 2 || b == -1) ? null : const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: (a != 2 || b == -1)
                  ? null
                  : Border.all(
                      color: Colors.white,
                      width: 5.0,
                    )),
          child: (a != 2 || b == -1)
              ? null
              : (a == 2 && sum > 7)
                  ? Text(
                      'Win',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    )
                  : Text(
                      'Lose',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
        ),
      ],
    );
  }
}
