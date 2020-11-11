import 'package:flutter/material.dart';

import '../Authentication/auth.dart';
import '../Authentication/auth.dart';

class Login extends StatefulWidget {
  
  final Function toggleView;
  Login({this.toggleView});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Text('Sign In'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            }, 
            icon: Icon(Icons.person), 
            label: Text('Register'))
        ],
      ),
      body: Container(
        child: Form(
           key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter email' : null,
                onChanged: (val) {
                setState(() {
                  email = val;
                });
              }),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.length < 6 ? 
                  'Enter password more than 6 characters long' : null,
                onChanged: (val) {
                  password = val;
                },
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.green[400],
                child: Text('Sign In'),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.login(email, password);
                    if(result == null){
                      setState(() {
                        error = 'Incorrect email/password';
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(error),
            ],
          ),
        ),
      ),
    );
  }
}
