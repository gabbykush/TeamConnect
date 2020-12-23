import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  static String id = 'RegisterPage';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
      ),
      body: Center(
        child: Column(
          children: [
                      TextFormField(
            decoration: InputDecoration(
              labelText: 'Username'
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password'
            ),
          ),
          ElevatedButton(
            //Register
            onPressed: null, child: Text('Register'),
          ),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Back'))
          ]
        ),)
    );
  }
}
