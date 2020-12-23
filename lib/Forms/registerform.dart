import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:teamconnect/Authentication/auth.dart';
import 'package:teamconnect/general/resources/routes.dart';
import 'package:teamconnect/pages/profile.dart';
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

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  String firstName = '';
  String lastName = '';
  int phone = 0;

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: loginDecoration("First Name"),
                      validator: (val) {
                        return val.isEmpty ? "Enter your first name" : null;
                      },
                      onChanged: (value) => firstName = value,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: loginDecoration("Last Name"),
                      validator: (val) {
                        return val.isEmpty ? "Enter your last name" : null;
                      },
                      onChanged: (value) => lastName = value,
                    ),
                  ),
                ],
              ),
            ),
            loginPadding(TextFormField(
              decoration: loginDecoration("Email"),
              validator: (val) {
                return EmailValidator.validate(val)
                    ? null
                    : 'Enter a valid email';
              },
              onChanged: (value) => email = value,
            )),
            loginPadding(TextFormField(
              decoration: loginDecoration("Password"),
              validator: (val) {
                return val.length < 6
                    ? "Enter a password more than 6 characters long"
                    : null;
              },
              onChanged: (value) => password = value,
            )),
            loginPadding(TextFormField(
              decoration: loginDecoration("Phone Number"),
              validator: (val) {
                return val.length != 10 ? 'Enter a valid phone number' : null;
              },
              keyboardType: TextInputType.number,
              onChanged: (value) => phone = int.parse(value),
            )),
            RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  dynamic result = await _auth.register(
                      email, password, firstName, lastName, phone);
                  if (result == null) {
                    setState(() {
                      error = "Email already in use";
                    });
                  } else {
                    Navigator.pop(context);
                  }
                }
              },
              color: Colors.blue[300],
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(error),
            SizedBox(
              height: 50,
            ),
            // Container(
            //   height: 30,
            //   width: 80,
            //   child: RaisedButton(
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //     child: Text(
            //       "Back to Login",
            //       style: TextStyle(fontSize: 10),
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // )
          ],
        ));
  }
}

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
