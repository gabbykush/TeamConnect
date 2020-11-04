import 'package:flutter/material.dart';
import 'package:teamconnect/Authentication/auth.dart';

class HomePage extends StatelessWidget {
 
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Log Out'))
          ],
        ),
        body: Center(
          child: Container(
            child: Text(':)'),
          ),
        ));
  }
}
