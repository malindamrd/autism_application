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
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              //margin: const EdgeInsets.only(top: 100),
              height: height/2,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                // image: DecorationImage(
                //   image: ExactAssetImage('images/flowers.jpeg'),
                //   fit: BoxFit.cover,
                // ),
                // border: Border.all(
                //   color: Colors.black,
                //   width: 8.0,
                // ),
              ),
            ),
            Container(
              height: height/2,
              decoration: BoxDecoration(
                color: const Color(0xffb39ddb),
                // image: DecorationImage(
                //   image: ExactAssetImage('images/flowers.jpeg'),
                //   fit: BoxFit.cover,
                // ),
                // border: Border.all(
                //   color: Colors.black,
                //   width: 8.0,
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
