import 'package:flutter/material.dart';
import 'package:teamconnect/Forms/profilecreationform.dart';
import 'package:teamconnect/Forms/profileform.dart';

class ProfileCreation extends StatefulWidget {
  @override
  _ProfileCreationState createState() => _ProfileCreationState();
}

class _ProfileCreationState extends State<ProfileCreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile Creation"),
      ),
      body: ProfileCreationForm(),
    );
  }
}
