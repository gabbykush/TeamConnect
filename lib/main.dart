import 'package:flutter/material.dart';
import 'package:teamconnect/login_success_test.dart';
import 'package:teamconnect/loginpage.dart';
import 'package:teamconnect/registerpage.dart';
import 'package:teamconnect/startpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: StartPage.id,
      routes: {
        LogInPage.id: (context) => LogInPage(),
        LoginSuccessPage.id: (context) => LoginSuccessPage(),
        RegisterPage.id: (context) => RegisterPage(),
        StartPage.id: (context) => StartPage(),
      },);
  }
}
