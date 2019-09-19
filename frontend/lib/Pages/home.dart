import 'dart:ffi';

import 'package:autism/Setup/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width - 20;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home'),
      // ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.jpg'),
                    fit: BoxFit.fill)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 100),
            width: width,
            child: Text(
              'Welcome to Autism Detection Application',
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: new TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: width,
                      child: Opacity(
                        opacity: 0.8,
                        child: RaisedButton(
                          onPressed: signOut,
                          child: Text('Questionnaire'),
                        ),
                      ),
                    ),
                    ButtonTheme(
                        minWidth: width,
                        child: Opacity(
                          opacity: 0.8,
                          child: RaisedButton(
                            onPressed: signOut,
                            child: Text('Past Results'),
                          ),
                        )),
                    ButtonTheme(
                        minWidth: width,
                        child: Opacity(
                          opacity: 0.8,
                          child: RaisedButton(
                            onPressed: signOut,
                            child: Text('Sign out'),
                          ),
                        ))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut().then((onValue) {
      return LoginPage();
    });
  }
}
