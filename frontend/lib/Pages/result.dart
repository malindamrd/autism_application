import 'package:autism/Pages/home.dart';
import 'package:autism/class/answers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResultPage extends StatelessWidget {
  Answers ans;
  ResultPage({Key key, this.title, @required this.ans}) : super(key: key);

  final String title;

  
  @override
  Widget build(BuildContext context) {
    print(ans.getArray());
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In '),
      ),
      body: Form(
        child: Column(),
      ),
    );
  }
}
