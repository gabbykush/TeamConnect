import 'package:flutter/material.dart';
import 'package:teamconnect/pages/register.dart';

import '../pages/login.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: loginDecoration("First Name"),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: TextFormField(
                  decoration: loginDecoration("Last Name"),
                ),
              ),
            ],
          ),
        ),
        loginPadding(TextFormField(
          decoration: loginDecoration("Email"),
        )),
        loginPadding(TextFormField(
          decoration: loginDecoration("Password"),
        )),
        loginPadding(TextFormField(
          decoration: loginDecoration("Phone Number"),
        )),
        RaisedButton(
          onPressed: () {},
          color: Colors.blue[300],
          child: Text(
            "Register",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          height: 30,
          width: 80,
          child: RaisedButton(
            onPressed: () {},
            child: Text(
              "Back to Login",
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
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
