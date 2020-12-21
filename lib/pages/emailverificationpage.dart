import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamconnect/Authentication/auth.dart';
import 'package:teamconnect/Widgets/loading_screen.dart';
import 'package:teamconnect/general/resources/routes.dart';

class EmailVerificationPage extends StatefulWidget {
  @override
  _EmailVerificationPageState createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Email Verification"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Center(
          child: Container(
            height: 100,
            child: Column(
              children: [
                Text("A verification email was sent to " + user.email),
                Text("Verify your email and restart the app to continue"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
