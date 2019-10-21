import 'package:autism/Pages/home.dart';
import 'package:autism/class/answers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPage createState() => _ResultPage();
}

class _ResultPage extends State<ResultPage> {
  var result = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter layout demo',
        home: Scaffold(
            body: new Container(
          child: Center(
            child: new Table(
              children: const <TableRow>[
                TableRow(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Test Result',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                    Center(
                      child: Text(
                        'C',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}
