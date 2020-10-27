import 'package:flutter/material.dart';
import 'package:teamconnect/login_success_test.dart';
import 'package:teamconnect/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: LogInPage.id,
      routes: {
        LogInPage.id: (context) => LogInPage(),
        LoginSuccessPage.id: (context) => LoginSuccessPage()
      },);
  }
}
