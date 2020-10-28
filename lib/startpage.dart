import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teamconnect/registerpage.dart';

import 'loginpage.dart';

class StartPage extends StatelessWidget {
  static String id = 'StartPage';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Welcome")),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, RegisterPage.id);
              }, child: Text('Register')),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, LogInPage.id);
              }, child: Text('Sign In')),
            
            ],
          ),
        ));
  }
}
