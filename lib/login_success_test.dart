import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teamconnect/main.dart';

class LoginSuccessPage extends StatelessWidget {
  static String id = 'LoginSuccessPage';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go Back")),
      ),
    );
  }
}
