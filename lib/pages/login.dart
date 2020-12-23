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
              margin: EdgeInsets.all(5),
              child: Center(child: Image.asset('lib/assets/connect_logo.png')),
              width: 250,
              height: 200,
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
