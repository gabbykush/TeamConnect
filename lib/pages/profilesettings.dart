import 'package:flutter/material.dart';
import 'package:teamconnect/Forms/profileform.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile Settings"),
      ),
      body: ProfileForm(),
    );
  }
}
