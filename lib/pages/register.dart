import 'package:flutter/material.dart';
import 'package:teamconnect/Authentication/auth.dart';
import 'package:teamconnect/Forms/registerform.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text('Register'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: RegisterForm(),
        ),
      ),
    );
  }
}
