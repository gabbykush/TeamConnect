import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teamconnect/Authentication/auth.dart';
import 'package:teamconnect/Services/collections.dart';
import 'package:teamconnect/Services/database.dart';
import 'package:teamconnect/Widgets/bottom_nav_bar.dart';
import 'package:teamconnect/Widgets/loading_screen.dart';
import 'package:teamconnect/Widgets/profiledisplay.dart';
import 'package:teamconnect/general/resources/dimension.dart';
import 'package:teamconnect/general/resources/font_styles.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService _auth = AuthService();

  String error = '';

  String firstName = '';
  String lastName = '';

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Profile>.value(
      value: DatabaseService().profile,
      child: Scaffold(
          backgroundColor: Colors.cyan[50],
          bottomNavigationBar: BottomNavigationConnect(index: 3),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(
                top: AppDimensions.defaultPadding,
                left: AppDimensions.defaultPadding,
                right: AppDimensions.defaultPadding),
            child: ProfileDisplay(),
          ))),
    );
  }
}
