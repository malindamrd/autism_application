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
  var result = TextEditingController();
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
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )),
                    Center(
                        child: Text(
                      ')',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ],
            ),
          ),
        )));
  }

  void getResult(answers) {
  
  }

  void _makeGetRequest(answers) async {
    // make GET request
    String url = "http://10.1.34.203:8080/autism_backend/rest/getResult?q1="+answers[0].toString()+"&q2="+answers[1].toString()+"&q3="+answers[2].toString()+"&q4="+answers[3].toString()+"&q5="+answers[4].toString()+"&q6="+answers[5].toString()+"&q7="+answers[6].toString()+"&q8="+answers[7].toString()+"&q9="+answers[8].toString()+"&q10="+answers[9].toString()+"&q11="+answers[10].toString()+"&q12="+answers[11].toString()+"&q13="+answers[12].toString()+"&q14="+answers[13].toString()+"&q15="+answers[14].toString()+"&q16="+answers[15].toString()+"&q17="+answers[16].toString()+"&q18="+answers[17].toString()+"&q19="+answers[18].toString()+"&q20="+answers[19].toString()+"&q21="+answers[20].toString();
    // String url = "http://10.1.34.203:8080/autism_backend/rest/getResult?";
    print(url);

    Response response = await get(url);
    // sample info available in response
    int statusCode = response.statusCode;
    // Map<String, String> headers = response.headers;
    // String contentType = headers['content-type'];
    String json = response.body;
    print(json);
    // TODO convert json to object...
  }

}
