import 'package:flutter/material.dart';
import 'package:teamconnect/Authentication/auth.dart';
import 'package:teamconnect/general/resources/routes.dart';
import 'package:teamconnect/pages/profile.dart';
import 'package:teamconnect/pages/register.dart';

import '../pages/login.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            loginPadding(TextFormField(
              decoration: loginDecoration("Email"),
              validator: (value) => value.isEmpty ? 'Enter email' : null,
              onChanged: (value) => email = value,
            )),
            loginPadding(TextFormField(
              decoration: loginDecoration("Password"),
              validator: (value) => value.isEmpty ? 'Enter password' : null,
              onChanged: (value) => password = value,
              obscureText: true,
            )),
            RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  dynamic result = await _auth.login(email, password);
                  if (result == null) {
                    setState(() {
                      error = 'Email/password is incorrect';
                    });
                  } else {
                    //Navigator.pop(context);
                  }
                }
              },
              color: Colors.yellow[600],
              child: Text(
                "Log In",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(error),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account",
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 30,
                  width: 80,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.register);
                    },
                    child: Text(
                      "Click to Register",
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}

// SizedBox(height: 20.0),
// TextFormField(
//     validator: (val) => val.isEmpty ? 'Enter email' : null,
//     onChanged: (val) {
//       setState(() {
//         email = val;
//       });
//     }),
// SizedBox(height: 20.0),
// TextFormField(
//   validator: (val) => val.length < 6
//       ? 'Enter password more than 6 characters long'
//       : null,
//   onChanged: (val) {
//     password = val;
//   },
//   obscureText: true,
// ),
// SizedBox(height: 20.0),
// RaisedButton(
//   color: Colors.green[400],
//   child: Text('Sign In'),
//   onPressed: () async {
//     if (_formKey.currentState.validate()) {
//       dynamic result = await _auth.login(email, password);
//       if (result == null) {
//         setState(() {
//           error = 'Incorrect email/password';
//         });
//       }
//     }
//   },
// ),
// SizedBox(height: 12.0),
// Text(error),

Padding loginPadding(TextFormField textFormField) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: textFormField,
  );
}

InputDecoration loginDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
  );
}
