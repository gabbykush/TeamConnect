import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teamconnect/login_success_test.dart';

class LogInPage extends StatelessWidget {
  static String id = 'LogInPage';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: LoginBody(),
    );
  }
}

//
class LoginBody extends StatelessWidget {
  const LoginBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: 'Username'),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Password'),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, LoginSuccessPage.id);
            },
            child: Text("LogIn")),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back'))
      ],
    ));
  }
}
