import 'package:flutter/material.dart';
import 'package:teamconnect/Authentication/auth.dart';



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
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Text('Register'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            }, 
            icon: Icon(Icons.person), 
            label: Text('Sign In'))
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
                child: Text('Register'),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.register(email, password);
                    if(result == null){
                      setState(() {
                        error = 'email is not valid';
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