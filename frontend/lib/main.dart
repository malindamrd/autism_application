import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Pages/home.dart';
import 'Setup/signin.dart';

void main(){
  runApp(new MaterialApp(
    title: "Autism App",
    home: _handlewindowdisplay(),
  ) );
}

Widget _handlewindowdisplay(){
return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: Text('Loading'));
        }
        else{
          if(snapshot.hasData){
            return Home();
          }
          else{
            return LoginPage();
          }
        }
      }
    );
}

