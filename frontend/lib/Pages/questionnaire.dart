import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Questionnaire extends StatefulWidget {
  @override
  _Questionnaire createState() => _Questionnaire();
}

class _Questionnaire extends State<Questionnaire> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              //margin: const EdgeInsets.only(top: 100),
              height: height / 2,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
              ),
            ),
            Container(
              height: height / 2,
              decoration: BoxDecoration(
                color: const Color(0xffb39ddb),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 10, 8.0, 40), 
                    child: Text(
                      'Question Goes Here',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: width,
                          child: Opacity(
                            opacity: 0.8,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Questionnaire()),
                                );
                              },
                              child: Text('Yes'),
                            ),
                          ),
                        ),
                        ButtonTheme(
                          minWidth: width,
                          child: Opacity(
                            opacity: 0.8,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Questionnaire()),
                                );
                              },
                              child: Text('No'),
                            ),
                          ),
                        ),
                        ButtonTheme(
                          minWidth: width,
                          child: Opacity(
                            opacity: 0.8,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Questionnaire()),
                                );
                              },
                              child: Text(
                                'Exit',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> loadQuestion() async{
    
  }
}
