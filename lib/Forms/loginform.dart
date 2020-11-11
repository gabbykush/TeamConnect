import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        loginPadding(TextFormField(
          decoration: loginDecoration("Email"),
        )),
        loginPadding(TextFormField(
          decoration: loginDecoration("Password"),
        )),
        RaisedButton(
          onPressed: () {},
          color: Colors.yellow[600],
          child: Text(
            "Log In",
            style: TextStyle(color: Colors.white),
          ),
        ),
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
                onPressed: () {},
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
