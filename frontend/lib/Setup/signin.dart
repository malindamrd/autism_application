import 'package:autism/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
 
  final String title;

  @override
  _LoginPageState createState() =>new  _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          children: <Widget>[
            TextFormField(
              validator: (input){
                if(input.isEmpty){
                  return 'Please type an email';
                }
              },
              onSaved: (input) => _email = input ,
              decoration: InputDecoration(
                labelText: 'Email'
              ),
            ),
 
            TextFormField(
              validator: (input){
                if(input.length < 5){
                  return 'Pleassse provice a password';
                }
              },
              onSaved: (input) => _password = input ,
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true,
            ),

            RaisedButton(
              onPressed: signIn,
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
    
  }

  Future<void> signIn() async{
    final formState = _formKey.currentState;
    if (formState.validate()){
      formState.save();
      try{
        AuthResult user =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home() ));
      }catch(e){
        print(e.message);
      }

    }
  }




}