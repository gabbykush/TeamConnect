import 'package:flutter/material.dart';
import 'package:teamconnect/login_success_test.dart';
import 'package:teamconnect/loginpage.dart';
import 'package:teamconnect/pages/homepage.dart';

import 'general/resources/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: GroupPage.id,
      routes: {
        GroupPage.id: (context) => GroupPage(),
        LogInPage.id: (context) => LogInPage(),
        LoginSuccessPage.id: (context) => LoginSuccessPage()
      },
    );
  }
}
