import 'dart:convert';

import 'package:autism/Pages/home.dart';
import 'package:autism/class/answers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

class ResultPage extends StatefulWidget {
  Answers myObject;
  ResultPage({this.myObject});

  

  @override
  _ResultPage createState() => _ResultPage();
}

class _ResultPage extends State<ResultPage> {
  String ressult = '0';
  var txt = TextEditingController();

  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _makeGetRequest(widget.myObject.getArray());

    // print(widget.myObject.getArray());
    // getResult(widget.myObject.getArray());

      return MaterialApp(
        title: 'Flutter layout demo',
        home: Scaffold(
          body: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(70, 250, 50, 50),
                      child: RichText(
                        text: TextSpan(
                          text: "Your Test Ressult",
                          style: TextStyle(fontSize: 35,  fontWeight: FontWeight.bold, color: Colors.black.withOpacity(1))

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 10, 8.0, 40),
                      child: RichText(
                        text: TextSpan(
                          text: txt.text,
                          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(1))
                        ),
                      ),
                    ),
                    ButtonTheme(
                          minWidth: 200,
                          height: 50,
                          textTheme: ButtonTextTheme.primary,
                          child: Opacity(
                            opacity: 0.8,
                            child: RaisedButton(
                              onPressed: () {
                                navigateHome();
                              },
                              color: const Color(0xFF006F50),
                              child: 
                                Text('Exit'),
                            ),
                          ),
                        ),
                  ],
                ),
              )
            ]
          )
        ),
    );
  }

  void getResult(answers) {}

  void _makeGetRequest(answers) async {
    // make GET request
    String url = "http://10.1.34.203:8080/autism_backend/rest/getResult?q1=" +
        answers[0].toString() +
        "&q2=" +
        answers[1].toString() +
        "&q3=" +
        answers[2].toString() +
        "&q4=" +
        answers[3].toString() +
        "&q5=" +
        answers[4].toString() +
        "&q6=" +
        answers[5].toString() +
        "&q7=" +
        answers[6].toString() +
        "&q8=" +
        answers[7].toString() +
        "&q9=" +
        answers[8].toString() +
        "&q10=" +
        answers[9].toString() +
        "&q11=" +
        answers[10].toString() +
        "&q12=" +
        answers[11].toString() +
        "&q13=" +
        answers[12].toString() +
        "&q14=" +
        answers[13].toString() +
        "&q15=" +
        answers[14].toString() +
        "&q16=" +
        answers[15].toString() +
        "&q17=" +
        answers[16].toString() +
        "&q18=" +
        answers[17].toString() +
        "&q19=" +
        answers[18].toString() +
        "&q20=" +
        answers[19].toString() +
        "&q21=" +
        answers[20].toString();
    // String url = "http://10.1.34.203:8080/autism_backend/rest/getResult?";

    Response response = await get(url);
    // sample info available in response
    int statusCode = response.statusCode;
    // Map<String, String> headers = response.headers;
    // String contentType = headers['content-type'];
    var data = json.decode(response.body);

    var prediction = data['predict'];
    if(prediction == 1){
      txt.text = "Negative";
    }
    else{
      txt.text = "Positive";
    }
    
  }

  void navigateHome(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home()),
      );
  }
}
