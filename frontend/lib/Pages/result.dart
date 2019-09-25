import 'package:autism/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key key, this.title}) : super(key: key);
 
  final String title;

  @override
  _ResultPageState createState() =>new  _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In '),
      ),
      body: Form(
        key: _formKey ,
        child: Column(
          
        ),
      ),
    );
    
  }






}