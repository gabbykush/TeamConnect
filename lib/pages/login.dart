import 'package:flutter/material.dart';
import 'package:teamconnect/Forms/loginform.dart';

import '../Authentication/auth.dart';
import '../Authentication/auth.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({this.toggleView});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        // backgroundColor: Colors.yellow[600],
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(50),
                child: Center(child: Text("ConnectNY Logo")),
                width: 150,
                height: 100,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black))),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
