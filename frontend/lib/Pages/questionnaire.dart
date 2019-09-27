import 'package:autism/Pages/result.dart';
import 'package:autism/class/answers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Questionnaire extends StatefulWidget {
  @override
  _Questionnaire createState() => _Questionnaire();
}

class _Questionnaire extends State<Questionnaire> {
  var txt = TextEditingController();
  int count = 0;
  var answers_list = new List(21);
  void initState() {
    loadQuestion(count);
    count += 1;
    super.initState();
  }

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
                // color: const Color(0xff7c94b6),
              ),
            ),
            Container(
              height: height / 2,
              decoration: BoxDecoration(
                // rcolor: const Color(0xffb39ddb),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 10, 8.0, 40),
                    child: TextField(
                      maxLines: null,
                      controller: txt,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                                saveAnswer(1);
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
                                saveAnswer(2);
                              },
                              color: const Color(0xFF006F50),
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
                                      builder: (context) => Home()),
                                );
                                
                              },
                              color: const Color(0xFF964B40),
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

  void loadQuestion(countt) {
    if (countt < 21) {
      String question = "q" + (countt + 1).toString();
      print(question);
      Firestore.instance
          .collection('questions')
          .document(question)
          .get()
          .then((strding) {
        print(strding['text']);

        txt.text = strding['text'];
      });
    } else {
      
      Answers an = new Answers(answers_list);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultPage(ans: an,)),
      );
    }
  }

  void saveAnswer(answer) {
    answers_list[count-1] = answer;
    print(answers_list);
    loadQuestion(count);
    count++;
  }
}
