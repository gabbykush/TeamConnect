import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamconnect/Authentication/auth.dart';
import 'package:teamconnect/Services/collections.dart';
import 'package:teamconnect/Services/database.dart';
import 'package:teamconnect/Widgets/loading_screen.dart';
import 'package:teamconnect/pages/emailverificationpage.dart';
import 'package:teamconnect/pages/homepage.dart';
import 'package:teamconnect/pages/login.dart';
import 'package:teamconnect/pages/profile.dart';
import 'package:teamconnect/pages/profilecreation.dart';

class AuthProvider extends StatefulWidget {
  @override
  _AuthProviderState createState() => _AuthProviderState();
}

class _AuthProviderState extends State<AuthProvider> {
  bool exists;

  Future<bool> _checkIfProfileExists(BuildContext context, User user) async {
    bool profile = await DatabaseService(uid: user.uid).checkIfProfileExists();
    if (!profile) {
      print('Profile does not exist');
      return false;
    } else {
      //print('Profile exists');
      return true;
    }
  }

  Future<bool> _checkIfEmailIsVerified(BuildContext context) async {
    bool isVerified = AuthService().isVerified();
    if (isVerified)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final _auth = AuthService();

    if (user == null)
      return Login();
    else {
      user.reload();
      return StreamBuilder<User>(
          stream: _auth.userChanges,
          builder: (context, verifiedSnapshot) {
            if (verifiedSnapshot.hasData) {
              if (verifiedSnapshot.data.emailVerified) {
                return FutureBuilder(
                    future: _checkIfProfileExists(context, user),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data)
                          return GroupPage();
                        else
                          return ProfileCreation();
                      } else
                        return LoadingScreen();
                    });
              } else
                return EmailVerificationPage();
            } else
              return LoadingScreen();
          });
    }
  }
}
// @override
// Widget build(BuildContext context) {
//   final user = Provider.of<User>(context);

//   if (user == null)
//     return Login();
//   else {
//     return FutureBuilder(
//         future: _checkIfProfileExists(context, user),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             if (snapshot.data)
//               return GroupPage();
//             else
//               return ProfileCreation();
//           } else
//             return LoadingScreen();
//         });
//   }
// }
